# Use Docker's official DinD image as the base image
FROM docker:latest

# Set the working directory inside the container
WORKDIR /CICDTEST

# Copy the test file into the container
COPY test_alwaysTrue.py /CICDTEST

# Install pytest (and any other Python dependencies you may need)
RUN apk add --no-cache python3 py3-pip && pip3 install pytest

# Install Docker CLI and other dependencies
RUN apk add --no-cache docker-cli

# Ensure Docker Daemon is started and available within the container
CMD ["sh", "-c", "dockerd-entrypoint.sh & pytest test_alwaysTrue.py"]




