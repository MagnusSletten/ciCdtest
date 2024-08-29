#!/bin/bash

# Configuration
GITHUB_REPO_URL="https://github.com/MagnusSletten/ciCdtest.git"  
GITHUB_USERNAME="MagnusSletten"  
GITHUB_EMAIL="magnus.elias.sletten@gmail.com"  
GH_TOKEN=${GH_TOKEN}  


git config --global init.defaultBranch main


git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"


WORKDIR="/CICDTEST"
REPO_DIR="$WORKDIR/ciCdtest"


if [ -d "$REPO_DIR" ]; then
    rm -rf "$REPO_DIR"
fi


git clone https://$GH_TOKEN@github.com/MagnusSletten/ciCdtest.git "$REPO_DIR"

cd $WORKDIR
cp database.txt $REPO_DIR/database.txt

cd $REPO_DIR

git add .
git commit -m "[skip ci] Automated update by CI/CD pipeline"
git push 
