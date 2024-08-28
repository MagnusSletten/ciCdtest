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
    git fetch origin main
    git checkout -b main
else
    git checkout main
fi

# Ensure that the working directory is clean
git reset --hard
git clean -fd

# Fetch the latest changes from the remote repository to avoid conflicts
git fetch origin main

# Merge the latest changes into the current branch
git merge origin/main --no-edit

# Add changes (here assuming database.txt is the file you're tracking)
git add database.txt

# Commit changes
git commit -m "[skip ci] Automated update by CI/CD pipeline"

# Push changes to the GitHub repository
git push origin main
