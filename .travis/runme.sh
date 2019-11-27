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

# Check git log length - TODO with tag
# commit_amount=$(git log start-here-tag.. --oneline | wc -l)
# if [ $commit_amount -ne 1 ];
# then bad "The files should have been added in a single commit, but I've found ${commit_amount} commits in the log. To reset and try again, delete the local start-here branch and checkout the original start-here branch again.";
# fi

# Check branch name
branch_name=$( git branch | grep "\*" | awk '{ print $2 }' )
if [ $branch_name != "start-here" ];
then bad "Branch name isn't start-here but rather ${branch_name}";
fi

# Everything's OK
flag rollinia-flints-lut
exit 0
