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

ls add_files_here -1

how_many_files=$(ls add_files_here -1 | wc -l)

if [ $how_many_files -lt 99 ]; 
    then bad "Not enough files: only "$how_many_files", need more than 99"
fi

# Check how many commits the user needed - shouldn't be more than 3 be two (the user commit + merge commit)!
commit_amount=$( git log premove-refile-misnomer-tag.. --oneline | wc -l )
if [ $commit_amount -gt 3 ];
    then bad "Too many commits! Took "$commit_amount" commits";
fi

flag "shill-foe-pickler"
exit 0
