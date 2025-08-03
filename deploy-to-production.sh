#!/bin/bash

# Our current setup has the `prod` branch as production and `main` as staging.
# This script merges the `main` branch into the `prod` branch and pushes the changes
# to the remote repository. I.e., it deploys the latest changes from `main` to `prod`.
# The `prod` branch is protected, so this script should be run manually by the repo owner.
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
