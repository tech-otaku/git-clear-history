#!/bin/bash
# Clear commit history for a given repository

# $1 is the name of the local repository in the /Users/steve/Developer/GitHub directory i.e mamp-mysql

if [ "$1" == "" ]; then
	printf "\nERROR: Usage is gch.sh REPOSITORY\n\n"
	exit 1
fi

DIRECTORY=/Users/steve/Developer/GitHub

if [ ! -d "$DIRECTORY/$1" ]; then
	printf "\nERROR: Repository '$DIRECTORY/$1' doesn't exist\n\n"
	exit 1
fi

# Change to the local repository's directory
cd "$DIRECTORY/$1"

# Remove the history
rm -rf .git

# Recreate the repos from the current content only
git init
git add .
git commit -m "Initial commit"

# Push to the GitHub remote repos ensuring you overwrite history
git remote add origin https://github.com/tech-otaku/"$1".git
git remote -v
git push -u --force origin master

cd ~/
