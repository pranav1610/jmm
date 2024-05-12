#!/bin/bash

# Define the variables for the test configurations
thread_models=("Platform" "Virtual")
state_sizes=(5 100)
state_types=("Null" "Synchronized" "Unsynchronized")
thread_counts=(1 8 40)
transitions=100000000

# Compile Java files
javac *.java

# Prepare the output file
echo "Running tests and saving outputs to output.txt..."
> output.txt

# Run tests for each combination and append outputs to output.txt
for model in "${thread_models[@]}"; do
    for size in "${state_sizes[@]}"; do
        for state in "${state_types[@]}"; do
            for threads in "${thread_counts[@]}"; do
                echo -e "\nTesting: Model=$model, Size=$size, State=$state, Threads=$threads" >> output.txt
                command="time timeout 3600 java UnsafeMemory $model $size $state $threads $transitions"
                echo -e "\n$command" >> output.txt
                eval $command >> output.txt 2>&1
            done
        done
    done
done

echo "Tests completed. Output saved to output.txt."
