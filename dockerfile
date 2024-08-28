# Start from the Python base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /CICDTEST

# Copy the Python script to the container
COPY sort_data.py /CICDTEST/sort_data.py

# Copy the data.txt file to the container
COPY data.txt /CICDTEST/data.txt

# Install necessary tools
RUN apt-get update && apt-get install -y git

# Install pytest if needed
RUN pip install pytest

# Copy the GitHub push script to the container
COPY push_to_github.sh /CICDTEST/push_to_github.sh

# Make the script executable
RUN chmod +x /CICDTEST/push_to_github.sh

# Run the Python script that reads data, sorts it, and writes to database.txt
# Then push the changes to GitHub
CMD ["bash", "-c", "python sort_data.py && ./push_to_github.sh"]

