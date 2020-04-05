all:
	@echo "Nothing for target 'all'."

import:
	./scripts/md-to-wiki.fish ../simsapa-dictionary-data/ncped.md && ./scripts/md-to-wiki.fish ../simsapa-dictionary-data/pts.md
