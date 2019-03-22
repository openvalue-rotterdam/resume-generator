
echo "Watching ./md for changes..."
fswatch -e ".*" -i ".*/[^.]*\\.md$" -0 ./md | xargs  -0 -n1 -I {} ./generate.sh "{}" $1
