#!/bin/bash

# Configuration
GITHUB_REPO_URL="https://github.com/MagnusSletten/ciCdtest.git"  # Use the correct GitHub repository URL
GITHUB_USERNAME="MagnusSletten"  # Your GitHub username
GITHUB_EMAIL="magnus.elias.sletten@gmail.com"  # Your GitHub email
GH_TOKEN=${GH_TOKEN}  # Use the environment variable for the access token

# Set default branch to main for this session
git config --global init.defaultBranch main

# Git configuration
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"

# Set the working directory explicitly
WORKDIR="/CICDTEST"

cd $WORKDIR

# Initialize a new Git repository if it doesn't already exist
if [ ! -d .git ]; then
    git init
    git remote add origin https://$GH_TOKEN@github.com/MagnusSletten/ciCdtest.git
    git fetch origin main
    git checkout -b main
else
    git fetch origin main
    git checkout main
    git reset --hard origin/main
fi

# Ensure the files are in the correct location
# If your files are expected to be in the /CICDTEST directory directly, you need to move them after cloning/pulling
# In this case, since we're working in /CICDTEST, make sure no nested directories are created

# Check and move files if necessary
if [ -d "ciCdtest" ]; then
    mv ciCdtest/* .
    rmdir ciCdtest
fi

# Check if the necessary files exist
if [ ! -f database.txt ]; then
    echo "database.txt not found in the current directory"
    exit 1
fi

# Add changes
git add database.txt

# Commit changes
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
else
    git commit -m "[skip ci] Automated update by CI/CD pipeline"
fi

# Push changes to the GitHub repository
git push origin main || { echo "Failed to push changes"; exit 1; }
