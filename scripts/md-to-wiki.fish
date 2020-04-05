#!/usr/bin/env fish

if test ! -d ".git"
    echo "Run this script in the project root folder."
    exit 2
end

set SRC $argv[1]
set TEMP_WORDS "temp_words.md"
set TEMP_DIR "w-temp"
set WORDS_DIR "w"

if test -z "$SRC"
    echo "First argument must be the Markdown dictionary file."
    exit 2
end

if test ! -f "$SRC"
    echo "Does not exist or not a file: $SRC"
    exit 2
end

mkdir -p "$WORDS_DIR"
mkdir -p "$TEMP_DIR"

cat "$SRC" |\
  sed '/--- DICTIONARY WORD ENTRIES ---/,$!d' |\
  grep -v -E -e '--- DICTIONARY WORD ENTRIES ---' |\
  perl -0777 -pe 's/(``` toml\n(.*?)\nword = "([^"]+)")/DICT_WORD=\3\n\n\1/gs' |\
  cat -s > "$TEMP_WORDS"

cd "$TEMP_DIR"

echo "Splitting to files ..."

perl -ne 'if(/^DICT_WORD=(.*)$/) {close F; open F, ">", sprintf("$1.md");} print F' "../$TEMP_WORDS"

for i in *.md
    echo "Processing $i ..."

    cat "$i" |\
      # Replace define links
      sed 's/[[]\([^]]\+\)[]](\/define\/\([^)]\+\))/[\1](\2.md)/g' |\
      # Remove empty defaults from TOML
      sed '/``` toml/,/```/{ s/^[^ ]\+ = \(""\|[[][]]\)//; /^$/d; }' |\
      cat -s > "$i.tmp"

   mv "$i.tmp" "$i"

    # Add the word to the dictionary files

    if test -f "../$WORDS_DIR/$i"
        # If this word already has a file, remove the title and append, separated with ---
        cat "$i" |\
          sed 's/^DICT_WORD=.*$/--------------------/' |\
          cat -s >> "../$WORDS_DIR/$i"
    else
        # Else, add a title and create the file.
        cat "$i" |\
          perl -0777 -pe 's/.*?DICT_WORD=([^\n]+)\n/# \1\n\n/gs' |\
          cat -s > "../$WORDS_DIR/$i"
    end

    rm "$i"
end

cd ..

rm "$TEMP_DIR" -r
rm "$TEMP_WORDS"
