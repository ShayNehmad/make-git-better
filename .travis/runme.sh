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

function echo_tag_commit_hash {
    echo $( git log -1 --format=format:"%h" $1 )
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


git fetch --tags --quiet  # get all the tags but don't show them to the user

# Check how many commits the user needed - should be two (the user commit + merge commit)!
commit_amount=$( git log start-here-tag.. --oneline | wc -l )
if [ $commit_amount -ne 2 ];
then bad "The files should have been added in a single commit, but I've found ${commit_amount} commits (including the merge commit that the pull request is trying to do) in the log. To reset and try again, delete the local start-here branch, checkout the original start-here branch again and try again.";
fi

# Check if only 2 files were changed
start_here_commit_hash=$( echo_tag_commit_hash start-here-tag )

parent_1=$( git log -1 | head -2 | tail -1 | awk '{ print $2 }' )
parent_2=$( git log -1 | head -2 | tail -1 | awk '{ print $3 }' )

echo "Let's look at the log..."
git log --oneline --graph -n 4 --decorate

echo "parent 1 hash: " $parent_1
echo "parent 2 hash: " $parent_2

# which parent is the user's commit? 
users_commit_hash=""
if [[ $parent_1 = $start_here_commit_hash ]] # parent1 is NOT the user's commit
then users_commit_hash=$parent_2
else users_commit_hash=$parent_1
fi

echo "User's commit was ${users_commit_hash}"

# We know that there's only one commit in the changes - otherwise it would have failed before.
number_of_files_changed=$( git diff --stat ${users_commit_hash} ${users_commit_hash}~1 | grep "files changed" | awk ' {print $1} ' ) 
if [[ $number_of_files_changed -ne 2 ]]
then bad "More than 2 files were changed! Only add alice.txt and bob.txt. Check out the original branch and try again.";
fi


# Everything's OK
flag rollinia-flints-lut
exit 0
