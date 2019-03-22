#!/bin/bash
CHANGED_FILEPATH="$1"

#### PARSE RESUME NAME

RESUME_NAME="${CHANGED_FILEPATH/$PWD\//}" # remove current path from string
RESUME_NAME="${RESUME_NAME/md\//}" # remove optional md/ prefix from string
RESUME_NAME="${RESUME_NAME/.md/}" # remove .md from file

#### PARSE STYLE (default is: /style/default)

STYLE_NAME="${2:-default}"

echo "Generating: ${RESUME_NAME}"
echo "Using style: $STYLE_NAME"

#### CREATE INPUT/OUTPUT FILENAMES

MD_FILENAME="md/${RESUME_NAME}.md"
HTML_FILENAME="html/${RESUME_NAME}.html"
PDF_FILENAME="pdf/${RESUME_NAME}.pdf"

echo "MD: $MD_FILENAME"
echo "HTML: $HTML_FILENAME"
echo "PDF: $PDF_FILENAME"

#### DELETE OLD OUTPUT FILES

echo "Cleaning up"
rm "$HTML_FILENAME"
rm "$PDF_FILENAME"

#### GENERATE HTML

echo "Generate HTML"

# To run local:
# pandoc -s -t html5 --css=../style/$STYLE_NAME/styling.css -o "./$HTML_FILENAME" "./$MD_FILENAME"

docker run -v `pwd`:/pandoc dalibo/pandocker --css=../style/$STYLE_NAME/styling.css -s -t html5 "/pandoc/$MD_FILENAME" -o "/pandoc/$HTML_FILENAME"

#### HTML TO PDF

echo "Generate PDF"
# To run local:
# wkhtmltopdf -s A4 --header-html ./style/$STYLE_NAME/header.html --footer-html ./style/$STYLE_NAME/footer.html "./$HTML_FILENAME" "./$PDF_FILENAME"

docker run --rm -v $(pwd):/data madnight/docker-alpine-wkhtmltopdf --dpi 300 --margin-top 20 -s A4 --header-html /data/style/$STYLE_NAME/header.html --footer-html /data/style/$STYLE_NAME/footer.html  "/data/$HTML_FILENAME" - > "./$PDF_FILENAME"

# Done.
echo "Finished"
