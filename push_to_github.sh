#!/bin/bash

# Configuration
GITHUB_REPO_URL="https://github.com/MagnusSletten/ciCdtest.git"  # Use the correct GitHub repository URL
GITHUB_USERNAME="MagnusSletten"  # Your GitHub username
GITHUB_EMAIL="magnus.elias.sletten@gmail.com"  # Your GitHub email
GH_TOKEN=${GH_TOKEN}  # Use the environment variable for the access token

# Set default branch to main for this session
git config init.defaultBranch main

# Git configuration
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"

# Initialize a new Git repository if it doesn't already exist
if [ ! -d .git ]; then
    git init
    git remote add origin https://$GH_TOKEN@github.com/MagnusSletten/ciCdtest.git
fi

# Check if the main branch exists, create it if it doesn't
if ! git rev-parse --verify main > /dev/null 2>&1; then
    git checkout -b main
else
    git checkout main
fi

# Add changes
git add database.txt

# Pull the latest changes to avoid conflicts
git pull --rebase https://x-access-token:${GH_TOKEN}@github.com/username/repository.git main

# Push changes to the GitHub repository
git push https://x-access-token:${GH_TOKEN}@github.com/username/repository.git main
