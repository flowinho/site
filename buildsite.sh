mkdir site-temp
cp -ir  website/* site-temp
cd site-temp/
find . -name \*.md -type f -exec pandoc --toc --highlight-style pygments -c pandoc.css -B includes/header.html -A includes/footer.html -o {}.html {} \;
find . -depth -name '*.md.html' -execdir bash -c 'mv -i "$1" "${1//md.html/html}"' bash {} \;
rm -rf ~/Public/
yes | cp -ir * ~/Public/
cd -
rm -rf site-temp

