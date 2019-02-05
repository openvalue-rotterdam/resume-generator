
echo "Watching ./md for changes..."
fswatch  -0 ./md | xargs  -0 -n1 -I {} ./generate.sh "{}"
