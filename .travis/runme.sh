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

printaline

# Check if the script itself ran successfully.
python ENCOM/login.py CLU
login_exit_code=$?
if [ $login_exit_code -ne 0 ];
then bad "Login failed...";
fi

echo "Fetching tags..."
git fetch --tags

flamenco_commit_hash=$( echo_tag_commit_hash flamenco-wens-violer-tag )

parent_1=$( git log -1 | head -2 | tail -1 | awk '{ print $2 }' )
parent_2=$( git log -1 | head -2 | tail -1 | awk '{ print $3 }' )

echo "Let's look at the log..."
git log --oneline --graph -n 10 --decorate

echo "parent 1 hash: " $parent_1
echo "parent 2 hash: " $parent_2

# which parent is the user's commit? 
users_commit_hash=""
if [[ $parent_1 = $flamenco_commit_hash ]] # parent1 is NOT the user's commit
then users_commit_hash=$parent_2
else users_commit_hash=$parent_1
fi

echo "User's commit was ${users_commit_hash}"

distance_to_flamenco=$( git rev-list --count ${flamenco_commit_hash}..${users_commit_hash} )

echo "Distance to flamenco: ${distance_to_flamenco}"

if [[ distance_to_flamenco -ne 1 ]]
then
    bad "Should solve this using only one commit!"
fi

echo "Trying to find v1.0.1104001 tag..."
rinz_ver_commit_hash=$( echo_tag_commit_hash v1.0.1104001 )
if [[ $rinz_ver_commit_hash != $users_commit_hash ]]
then
    bad "Didn't find version tag!"
fi
printaline

flag "premove-refile-misnomer"
exit 0
