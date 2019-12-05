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

function echo_parents_amount {
    echo $( git cat-file -p $1 | grep parent | wc -l )
}

function is_merge_commit {
    echo "in is merge commit"
    if [[ echo_parents_amount $1 -eq 2 ]]
    then
        echo "is merge commit"
        true
    else
        echo "isn't merge commit"
        false
    fi
}

printaline
echo "Testing ENCOM basic access script."

# Check if the script itself ran successfully.
python ENCOM/login.py CLU
login_exit_code=$?
if [ $login_exit_code -ne 0 ];
then bad "Login failed...";
fi

# Check if the correct parent is a merge commit
git fetch --tags -q
ethers_commit_hash=$( echo_tag_commit_hash ethers-kalongs-asylum-tag )
parent_1=$( git log -1 | head -2 | tail -1 | awk '{ print $2 }' )
parent_2=$( git log -1 | head -2 | tail -1 | awk '{ print $3 }' )

echo "parent 1 hash: " $parent_1
echo "parent 2 hash: " $parent_2

echo "Let's look at the log..."
git log --oneline --graph --decorate -n 4

echo "checking p1"
if [[ $parent_1 != $ethers_commit_hash ]] && [[ is_merge_commit $parent_1 ]]
then 
    bad "Your commit isn't a merge commit! You must solve this stage using a merge. Try again."
fi

echo "checking p2"
if [[ $parent_2 != $ethers_commit_hash ]] && [[ is_merge_commit $parent_2 ]]
then 
    bad "Your commit isn't a merge commit! You must solve this stage using a merge. Try again.";
fi

flag "sylvanly-narrower-oxboy"
exit 0
