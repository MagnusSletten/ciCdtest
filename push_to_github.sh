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
REPO_DIR="$WORKDIR/ciCdtest"

# Remove the existing repo directory if it exists to start fresh
if [ -d "$REPO_DIR" ]; then
    rm -rf "$REPO_DIR"
fi

# Clone the repository
git clone https://$GH_TOKEN@github.com/MagnusSletten/ciCdtest.git "$REPO_DIR"

# Navigate to the repository directory
cd "$REPO_DIR"

# Ensure we are on the main branch
git checkout main

# Check if the necessary files exist
if [ ! -f database.txt ]; then
    echo "database.txt not found in the current directory"
    exit 1
fi

# Add and commit changes
git add database.txt

# Check if there are any changes to commit
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
else
    git commit -m "[skip ci] Automated update by CI/CD pipeline"
fi

# Push changes to the GitHub repository
git push origin main || { echo "Failed to push changes"; exit 1; }
