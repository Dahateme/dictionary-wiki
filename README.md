# Simsapa Pali Word Dictionary Wiki

This is a Pali dictionary with the word entries represented as Markdown files
and their metadata as TOML blocks.

The [simsapa-vscode](https://github.com/simsapa/simsapa-vscode) is a helper
extension for the [VS Code editor](https://code.visualstudio.com/), which
provides editing features for this dictionary.

Download the files, install the extension in VS Code, then use the 'File > Open
Folder' menu.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Simsapa Pali Word Dictionary Wiki](#simsapa-pali-word-dictionary-wiki)
    - [Download](#download)
    - [File Format Conventions](#file-format-conventions)
        - [Glossing texts or chants](#glossing-texts-or-chants)
        - [Dictionary entries](#dictionary-entries)
    - [Sources](#sources)

<!-- markdown-toc end -->

## Download

Download these files as a ZIP Archive either with the link below.

[dictionary-wiki-master.zip](https://github.com/simsapa/dictionary-wiki/archive/master.zip)

Or use `git` to clone the repository:

```
git clone https://github.com/simsapa/dictionary-wiki.git
```

## File Format Conventions

### Glossing texts or chants

See for example [chants/yo so bhagavā.md](chants/yo%20so%20bhagavā.md).

Glossed texts or chants are expected to be in a subfolder of the project root,
so that word links such as `../w/kamma.md` will work.

```
chants/
  yo so bhagavā.md
suttas/
  sn-56-11.md
w/
README.md
```

Separate single lines with blank lines. End with a backslash `\` to indicate a
forced-linebreak, such as in chanting lines.

Separate paragraphs with `---`.

The above serves to be able to reconstruct the original text with its line- and
paragraph breaks.

So that the following glossed text:

``` markdown
Arahaṃ sammāsambuddho bhagavā \

- Arahaṃ
- sammāsambuddho
- bhagavā

Buddhaṃ bhagavantaṃ abhivādemi

- Buddhaṃ
- bhagavantaṃ
- abhivādemi

---

[Svākkhāto] bhagavatā dhammo \

- Svākkhāto
- bhagavatā
- dhammo

Dhammaṃ namassāmi

- Dhammaṃ 
- namassāmi
```

Can be restored to the original by removing the word lists, blank lines, and
replacing `---` with a blank line.

``` markdown
Arahaṃ sammāsambuddho bhagavā \
Buddhaṃ bhagavantaṃ abhivādemi

[Svākkhāto] bhagavatā dhammo \
Dhammaṃ namassāmi
```

In word lists, not all items have to be links. Compound words may be broken into
sub-items, or conjugation may be explained.

``` markdown
- sammāsambuddho: the Rightly Self-Awakened One, compound
  - [sammā](../w/sammā.md): properly, rightly
  - sambuddho: completely awakened
    - saṃ-: completeness of action
    - buddho: one who has understood, p.p. of [bujjhati](../w/bujjhati.md)
```

### Dictionary entries

See for example [upagacchati](w/upagacchati.md).

Word entries are in the `w/` folder. The file name corresponds to the dictionary
word or phrase. Diacritics, hyphens and spaces are allowed in the file names.
When writing Markdown links, the spaces have to be encoded as `%20`, such as
`[api ca](api%20ca.md)`. (The
[simsapa-vscode](https://github.com/simsapa/simsapa-vscode) extension handles
that.)

The level-1 header `#` (title) is the dictionary word. There may be only one
title per file.

There may be multiple entries for a given word, such as from different
dictionaries, separated by `---`.

A word entry should include a TOML block to describe metadata. There may be only
one TOML block per word entry. This may be anywhere, at the beginning, middle-
or end of the entry.

The rest of the word entry is its formatted definition, explanation and examples.

The definition may include links to other words, such as

```
Upagacchati is pp. of *[upagata](upagata.md)*.
```

## Sources

This was started by splitting the single-file Markdown files at
[simsapa-dictionary-data](https://github.com/simsapa/simsapa-dictionary-data),
which was in turn based on the
[suttacentral/sc-data](https://github.com/suttacentral/sc-data).

