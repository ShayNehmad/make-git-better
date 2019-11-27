#!/bin/bash

function printaline {
    echo "*********************************************************************"
}

function bad {
    echo $1
    printaline
    exit 1
}

printaline
echo "Looks like you've started the challenge. Good luck!"

# Check file existence. 
if [ ! -f alice.txt ]; 
then bad "Alice is missing! Try again.";
fi

if [ ! -f bob.txt ]; 
then bad "Bob is missing! Try again.";
fi

# Check git log length
commit_amount=$(git log start-here.. --oneline | wc -l)
if [ $commit_amount -ne 1 ];
then bad "The files should have been added in a single commit, but I've found ${commit_amount} commits in the log. To reset and try again, delete the local start-here branch and checkout the original start-here branch again.";
fi

# Everything's OK
printaline
exit 0
