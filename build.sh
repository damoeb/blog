#!/usr/bin/env bash
echo "* Clone theme"
#git clone https://github.com/Track3/hermit.git themes/hermit
git clone https://github.com/adityatelange/hugo-PaperMod themes/hugo-PaperMod --depth=1
echo "* hugo build"
hugo -b https://migor.org
#hugo -b http://localhost:3000

