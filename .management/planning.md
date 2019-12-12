# What is this

A planning document. **Don't look at this if you plan to do the workshop!**

## What do we assume

* Git installed
* Basic knowledge+ (local vs. remote, what is a branch, staging area).

## What do we want to teach

1. ✅ GitHub forks
1. ✅ git clone
1. ✅ git checkout branch
1. ✅ git add
1. ✅ git commit
1. ✅ git push
1. ✅ GitHub pull requests
1. ✅ git revert
1. ⏹ git fetch vs. git pull
1. ✅ git fetch --tags
1. ✅ git merge (clean)
1. ✅ git merge (with conflicts)
1. ✅ git merge vs. git rebase
1. ⏹ git cherry-pick (and why it's bad?)
1. ⏹ back-merges
1. ✅ git log --decorate=full
1. ⏹ git submodule add
1. ⏹ git diff
1. ⏹ git branch
1. ⏹ git tag
1. ✅ git remote
1. ⏹ Revert a specific file
1. ⏹ Edit commit messages that have already been pushed (with push -f)
1. ⏹ Delete a branch locally and remotely
1. ⏹ Working directory VS Staging area (using a script that adds stuff maybe?)

## Stages

The stages are one after another and the flag for each stage will be the next branch name.

### 1 `master`

Points to the readme which covers fork (1), clone (2) and checkout branch (2). Points to the next stage.

#### Status

* Happy flow ✅
* Edge cases ✅ (There are none)

### 2 `start-here`

Covers add (4), commit (5), push (6) and pull requests (7). If you add the 2 required files in a single commit you'll get a check and the next 🚩 from Travis's output.

> Question: All PRs are to the original repo same branch?

#### Status

* Happy flow ✅
* Edge cases ✅
* * More than one commit ✅
* * More then 2 files ✅

### 3 `rollinia-flints-lut`

Now we're cooking with gas. Let's try a clean merge from another branch (`albanian-novalike-shaup`) into this one. Should add a directory called `src/` with a script that returns 0.

What's the test to pass?

* The commit was a merge commit (`if ( git cat-file -p $commit-id | grep parent | wc -l == 1 ) then bad else good`)
* Only one commit (`git log start-here.. --oneline | wc -l`)
* Call the script itself

The script itself just return 0 (maybe prints something cute). Travis runs it and if it passes - 🚩.

#### Status

* Happy flow ✅
* Edge cases ⏹ Pushing not a merge, lots of commits in the way.

### 4 `ethers-kalongs-asylum`

Let's have a merge conflict.

The `src/script.sh` has grown bigger in this branch and we want to merge changes from `grubbery-unopenly-unhushed` using git merge. The changes will cause a conflict. The point is to resolve them successfully.

Tests are the same as last time 🚩

#### Status

* Happy flow ✅
* Edge cases ⏹ Pushing not a merge, lots of commits in the way.

### 5 `sylvanly-narrower-oxboy`

`sylvanly-narrower-oxboy` is our feature branch and `sealed-updrink-kashyapa` is our master branch.

This branch will have a required fix (turn `exit 1` into `exit 0`), which we will do,  add, commit, push. Then (Travis will tell us to) revert it, and then (travis will tell us) to reapply it again. (Travis will choose the error message acccording to the log length).

Then we'll use rebase (on `sealed-updrink-kashyapa`) instead of merge to clean the history. 🚩

#### Tests

* No merge commits
* Only one commit in `sealed-updrink-kashyapa..sylvanly-narrower-oxboy`
* Script passes

#### Status

* Happy flow ✅
* Edge cases ⏹ Pushing a merge instead of a rebase

### 6 `flamenco-wens-violer`

Create a tag named `v1.2.3` and push it. Travis checks for the existence of the tag (and a match on the known commit hash) and 🚩.

#### Status

* Happy flow ✅
* Edge cases ✅ No tag
* Edge cases ⏹ Too many commits

### 7 `jigman-poppel-purl`

The next challenge is two-fold: the 🚩 is the tag 2 commits before this branch. Will require the challenger to do the following things:

* figure out how to get tags `git fetch --tags`
* figure out how to look at tags (`git log --decorate=full`)

#### Status

* Happy flow ✅

### 8 `nicenist-golp-goback`

In this branch there is a `dontreadme.sh` script which Travis runs and fails.

In a different fork of the repo, a file exists which causes this script to pass. We need to add that repo as a remote (`git remote add https://github.com/OtherUser/make-git-better remote2`) and merge changes from `remote2/nicenist-golp-goback` branch into `nicenist-golp-goback`.

Travis will give 🚩 if the script passes in the PR.

#### Status

* TODO, currently this is the win stage.

### 9 `premove-refile-misnomer`

TODO fix a bad merge that has been commited and pushed (with the merge dividers): possibly, rewrite history with `push -f`.

### 10 `broom-tagalong-fumify`

End, `🍰 is a li3` etc.
