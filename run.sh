#!/bin/bash

# Compile all Java files in the current directory
javac *.java

# Run the Python script and save the output to output.txt
python test.py > output.txt 2>&1

echo "Tests completed. Output saved to output.txt."
