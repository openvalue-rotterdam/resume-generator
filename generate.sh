#!/bin/bash
CHANGED_FILEPATH="$1"
MD_FILENAME="${CHANGED_FILEPATH/$PWD\//}" # remove current path from string

MD_FILENAME="md${MD_FILENAME/md/}" # remove markdown folder from string
HTML_FILENAME="${MD_FILENAME//md/html}"
PDF_FILENAME="${MD_FILENAME//md/pdf}"

echo "MD: $MD_FILENAME"
echo "HTML: $HTML_FILENAME"
echo "PDF: $PDF_FILENAME"


echo "Cleaning up"
rm "$HTML_FILENAME"
rm "$PDF_FILENAME"



#### GENERATE HTML
echo "Generate HTML"
# To run local:
# pandoc -s -t html5 --css=../styling.css -o "./$HTML_FILENAME" "./$MD_FILENAME"

docker run -v `pwd`:/pandoc dalibo/pandocker --css=../styling.css -s -t html5 "/pandoc/$MD_FILENAME" -o "/pandoc/$HTML_FILENAME"



#### HTML TO PDF
echo "Generate PDF"
# To run local:
# wkhtmltopdf -s A4 --header-html ./header.html --footer-html ./footer.html "./$HTML_FILENAME" "./$PDF_FILENAME"

docker run --rm -v $(pwd):/data madnight/docker-alpine-wkhtmltopdf --dpi 300 --margin-top 20 -s A4 --header-html /data/header.html --footer-html /data/footer.html  "/data/$HTML_FILENAME" - > "./$PDF_FILENAME"

echo "Finished"
