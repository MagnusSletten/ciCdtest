def reformatData(number):
    # Convert the number to a string, sort the characters, and join them back into a string
    sorted_digits = ''.join(sorted(str(number)))
    return sorted_digits

if __name__ == "__main__":
    try:
        # Step 1: Read the number from data.txt
        with open("data.txt", "r") as file:
            content = file.read().strip()  # Read and strip any surrounding whitespace
            print("Original data read from data.txt:", content)  # Debugging: print the data read

        # Step 2: Reformat the data (sort the digits)
        result = reformatData(content)
        print("Sorted digits:", result)  # Debugging: print the sorted digits

        # Step 3: Write the result to database.txt
        with open("database.txt", "w") as file:
            file.write(result)  # Write the sorted digits to the file
            print("Data written to database.txt:", result)  # Debugging: confirm write operation

    except Exception as e:
        print("An error occurred:", e)  # Error handling: print any errors that occur
