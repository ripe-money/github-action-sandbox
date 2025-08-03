#!/bin/bash

# Simple Hello World bash script
echo "Hello, World!"

git fetch
git checkout main
git pull origin main
git checkout prod
git pull origin prod

git merge --ff-only main
if [ $? -eq 0 ]; then
    echo "Merge successful. Pushing changes to prod branch."
    git push origin prod
    git checkout main
    git branch -d prod
else
    echo "Merge failed. Please resolve conflicts and try again."
fi
