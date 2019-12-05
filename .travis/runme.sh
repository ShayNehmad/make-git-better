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

# Try to "convince castor"
chmod +x ENCOM/convince_castor.sh 
ENCOM/convince_castor.sh
typeset -i castor=$(cat offer)

echo "Trying to convince castor with ${castor}"

git fetch --tags -q
sylvanly_commit_hash=$( echo_tag_commit_hash sylvanly-narrower-oxboy-tag )
sealed_commit_hash=$( echo_tag_commit_hash sealed-updrink-kashyapa-tag )

parent_1=$( git log -1 | head -2 | tail -1 | awk '{ print $2 }' )
parent_2=$( git log -1 | head -2 | tail -1 | awk '{ print $3 }' )

echo "Let's look at the log..."
git log --oneline --graph -n 10 --decorate

echo "parent 1 hash: " $parent_1
echo "parent 2 hash: " $parent_2

# which parent is the user's commit? 
users_commit_hash=""
if [[ $parent_1 = $sylvanly_commit_hash ]] # parent1 is NOT the user's commit
then users_commit_hash=$parent_2
else users_commit_hash=$parent_1
fi

echo "User's commit was ${users_commit_hash}"

distance_to_sylvanly=$( git log ${sylvanly_commit_hash}..${users_commit_hash} --oneline | wc -l )
distance_to_sealed=$( git log ${sealed_commit_hash}..${users_commit_hash} --oneline | wc -l )

echo "Distance to sylvanly: ${distance_to_sylvanly}"
echo "Distance to sealed: ${distance_to_sealed}"

if [[ distance_to_sealed -eq 0 ]] # Not after rebase since sealed isn't in our history
then
    if [[ $distance_to_sylvanly -eq 1 ]]
    then
        echo "CASTOR SAYS: This looks like the first attempt."
        if [[ $castor -eq 66 ]]
        then
            bad "CASTOR SAYS: 66 is a nice offer... But it's not enough! Please offer me 77 instead."
        else 
            bad "CASTOR SAYS: Please offer me 66, and make it the FIRST offer (in the 1st commit)!"
        fi
    elif [[ $distance_to_sylvanly -eq 2 ]]
    then
        echo "CASTOR SAYS: This looks like the second attempt."
        if [[ $castor -eq 77 ]]
        then
            bad "CASTOR SAYS: I see you offer me 77. I changed my mind again! Please REVERT the last commit and offer me 66 again!"
        else 
            bad "CASTOR SAYS: Please offer me 77, and make it the SECOND offer (in the 2nd commit)!"
        fi
    elif [[ $distance_to_sylvanly -eq 2 ]]
    then
        echo "CASTOR SAYS: This looks like the third attempt."
        if [[ $castor -eq 66 ]]
        then
            echo "CASTOR SAYS: I see you offer me 66 again! That's great! Now just let me check one more thing..."
            bad "CASTOR SAYS: Your offer is good, but please REBASE your offer on sealed-updrink-kashyapa! 
            I can't offer you the flag while we're working on the sylvanly-narrower-oxboy branch, that's no way to do business. This branch is watched by ENCOM!"
        else 
            bad "CASTOR SAYS: Please offer me 66, and make it the THIRD offer (in the 3rd commit)!"
        fi
else  # After rebase or merge, since sealed is in our history
    echo "CASTOR SAYS: Looks like we're after the rebase."
    if [[ $( echo_parents_amount ${users_commit_hash} ) -eq 2 ]]
    then
        bad "CASTOR SAYS: Looks to me like you've used MERGE, and not REBASE! Try again and use rebase this time!"
    else
        if [[ $castor -eq 66 ]]
        then
            echo "CASTOR SAYS: 66 seems like a good offer, and you rebased correctly on sealed-updrink-kashyapa. Fine, I'll tell you the next step. Just don't tell Clu about this..."
            flag "flamenco-wens-violer"
            exit 0
        fi
    fi
fi

bad "Some unexpected flow happened, try again."
exit 1
