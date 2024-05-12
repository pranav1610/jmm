import subprocess

def run_test(thread_model, state_size, state_type, thread_count, transitions):
    command = [
        "time", "timeout", "3600", "java", "UnsafeMemory",
        thread_model, str(state_size), state_type, str(thread_count), str(transitions)
    ]

    print('running: ', command)
    result = subprocess.run(command, capture_output=True, text=True)
    return result

def main():
    thread_models = ["Platform", "Virtual"]
    state_sizes = [5, 100]
    state_types = ["Synchronized", "Unsynchronized"]
    thread_counts = [1, 8, 40]
    transitions = 100000000

    for model in thread_models:
        for size in state_sizes:
            for state in state_types:
                for threads in thread_counts:
                    print(f"Testing: Model={model}, Size={size}, State={state}, Threads={threads}")
                    result = run_test(model, size, state, threads, transitions)
                    print(f"Output: {result.stdout}")
                    if result.stderr:
                        print(f"Errors: {result.stderr}")

if __name__ == "__main__":
    main()


