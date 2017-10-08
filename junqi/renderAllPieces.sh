#!/bin/bash

# Measures total render time()
START_TIME=$SECONDS

# Path to openscad binary - just makes stuff tidy
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
render() {
	  echo "Rendering "${1}"...."
		file_name=${1}.stl
		# Remove the current output file
		rm -f ${file_name}
		# The actual command
		${OPENSCAD} -o ${file_name} -D filename='"'${1}'"' \
		pieces.scad
}

renderAll=''

for i in *.svg; do
    [ -f "$i" ] || break
    renderAll=$renderAll"render $i & "
done

$renderAll

ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "Done. Execution time: $(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec"
