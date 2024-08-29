def reformatData(number):
    sorted_digits = ''.join(sorted(str(number)))
    return sorted_digits

if __name__ == "__main__":
    try: 
        with open("data.txt", "r") as file:
            content = file.read().strip() 

        result = reformatData(content)
       
        with open("database.txt", "w") as file:
            file.write(result)  
            print("Data written to database.txt:", result)  

    except Exception as e:
        print("An error occurred:", e)  