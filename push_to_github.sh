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

cd $WORKDIR
cp database.txt $REPO_DIR/database.txt

cd $REPO_DIR

git add .
git commit -m "[skip ci] Automated update by CI/CD pipeline"
git push 
