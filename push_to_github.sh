#!/bin/bash

# Configuration
GITHUB_REPO_URL="https://github.com/MagnusSletten/ciCdtest"  # Replace with your GitHub repository URL
GITHUB_USERNAME="MagnusSletten"  # Replace with your GitHub username
GITHUB_EMAIL="magnuskonge@gmail.com"  # Replace with your GitHub email
GH_TOKEN=${GH_TOKEN}  # Use the environment variable for the access token

# Git configuration
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"

# Initialize a new Git repository if it doesn't already exist
if [ ! -d .git ]; then
    git init
    git remote add origin $GITHUB_REPO_URL
    git fetch
    git checkout main  # Adjust if using a different default branch name
fi

# Add changes
git add database.txt

# Commit changes
git commit -m "[skip ci] Update database.txt with sorted data"

# Push changes to the GitHub repository using the access token
git push https://$GH_TOKEN@github.com/your-username/your-repo.git main
