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
echo "Testing ENCOM basic access script."

# Check if the script itself ran successfully.
python ENCOM/login.py
login_exit_code=$?
if [ $login_exit_code -ne 0 ];
then bad "Login failed...";
fi

# Check if the correct parent is a merge commit
git fetch --tags -q
rollinia_commit_hash=$( git log -1 --format=format:"%h" rollinia-flints-lut-tag )
parent_1=$( git log -1 | head -2 | tail -1 | awk '{ print $2 }' )
parent_1_parents_amount=$( git cat-file -p ${parent_1} | grep parent | wc -l )
parent_2=$( git log -1 | head -2 | tail -1 | awk '{ print $3 }' )
parent_2_parents_amount=$( git cat-file -p ${parent_2} | grep parent | wc -l )

echo "p1: " $parent_1 
echo "p1 #: " $parent_1_parents_amount
echo "p2: " $parent_2
echo "p2 #: " $parent_2_parents_amount
echo "hash: " $rollinia_commit_hash

if [ ( $parent_1 != rollinia_commit_hash ) -a ( $parent_1_parents_amount != 2 ) ];
then bad "The commit isn't a merge commit! You must solve this stage using a merge. Try again.";
elif [ ( $parent_2 != rollinia_commit_hash ) -a ( $parent_2_parents_amount != 2 ) ];
then bad "The commit isn't a merge commit! You must solve this stage using a merge. Try again.";
else bad "Couldn't find merge commit!"
fi

flag "ethers-kalongs-asylum"
exit 0
