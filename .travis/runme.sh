#!/bin/bash

function printaline {
    echo "*********************************************************************"
}

function flag {
    echo "              ______________ "
    echo " _____________\            / "
    echo "|               __        /  "
    echo "|  __      __  | _       /   "
    echo "| |__ |   |__| |__|      \   "
    echo "| |   |__ |  |            \  "
    echo "|                __________\ "
    echo "|________________\           "
    echo "|                            "
    echo "|                            "
    echo "|                            "
    echo "|                            "
    echo "|                            "
    echo "|                            "
    echo "|                            "
    echo "|                            "
    echo "|     The flag is...         "
    echo "|                            "
    echo $1
}

function bad {
    echo "Something went wrong!"
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


git fetch --tags > /dev/null  # get all the tags but don't show them to the user

# Check how many commits the user needed - should be one!
commit_amount=$( git log start-here-tag.. --oneline | wc -l )
if [ $commit_amount -ne 1 ];
then bad "The files should have been added in a single commit, but I've found ${commit_amount} commits in the log. To reset and try again, delete the local start-here branch, checkout the original start-here branch again and try again.";
fi

# Everything's OK
flag rollinia-flints-lut
exit 0
