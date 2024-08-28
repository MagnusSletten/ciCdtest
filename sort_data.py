def reformatData(data):
    newData = sorted(data)  # Use sorted() to return a new sorted list
    return newData

if __name__ == "__main__":
    # Step 1: Read numbers from data.txt
    with open("data.txt", "r") as file:
        data = list(map(int, file.read().split()))  # Read and convert data to a list of integers

    # Step 2: Reformat the data
    result = reformatData(data)

    # Step 3: Write the result to database.txt
    with open("database.txt", "w") as file:
        file.write(' '.join(map(str, result)))  # Write the sorted data to the file
