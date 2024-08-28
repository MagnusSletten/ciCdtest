# Start from the Python base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /CICDTEST

# Copy necessary files to the container
COPY sort_data.py /CICDTEST/sort_data.py
COPY data.txt /CICDTEST/data.txt
COPY push_to_github.sh /CICDTEST/push_to_github.sh

# Install necessary tools
RUN apt-get update && apt-get install -y git

# Install pytest if needed
RUN pip install pytest

# Make the script executable
RUN chmod +x /CICDTEST/push_to_github.sh

# Run the Python script and then the GitHub push script
CMD ["bash", "-c", "python /CICDTEST/sort_data.py && /CICDTEST/push_to_github.sh"]

