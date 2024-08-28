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

# Initialize a new Git repository if it doesn't already exist
if [ ! -d .git ]; then
    git init
    git remote add origin https://$GH_TOKEN@github.com/MagnusSletten/ciCdtest.git
fi

# Fetch the latest changes from the remote repository
git fetch origin

# Check if the main branch exists, create it if it doesn't
if git show-ref --verify --quiet refs/heads/main; then
    git checkout main
    git pull origin main
else
    git checkout -b main
fi

# Attempt to merge changes from remote main branch
git merge origin/main --no-edit || { echo "Merge conflict occurred"; exit 1; }

# Add changes (here assuming database.txt is the file you're tracking)
if [ -f database.txt ]; then
    git add database.txt
else
    echo "database.txt not found. Ensure the file exists before committing."
    exit 1
fi

# Add other files as needed, e.g., data.txt
if [ -f data.txt ]; then
    git add data.txt
fi

# Commit changes if there are any
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
else
    git commit -m "[skip ci] Automated update by CI/CD pipeline"
fi

# Push changes to the GitHub repository
git push origin main || { echo "Failed to push changes"; exit 1; }
