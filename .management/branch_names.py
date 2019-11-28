import os
import random

import git

SET_LENGTH = 10
RANDOM_WORDS_PER_NAME = 3
MINIMUM_WORDS_LENGTH = 2
MAXIMUM_WORDS_LENGTH = 9


def main():
    print("I'm the branch name generator.\nHere are some names for you:\n")
    words = load_words()
    print(len(words))

    # Filter to mostly normal pronounceable words
    words = set(filter(lambda x: MINIMUM_WORDS_LENGTH < len(x) < MAXIMUM_WORDS_LENGTH, words))

    print(len(words))
    names_set = generate_names_set(words)
    print(names_set)

    repo_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    repo = git.Repo(repo_dir)

    for branch_name in names_set:
        create_and_push_branch(repo, branch_name)
        print("Pushed {0}, checking out dev".format(branch_name))
        repo.git.checkout('dev')

    
def load_words():
    """
    Loads words from english-words repo.
    :return: Set of valid words.
    """
    with open(os.path.join('english-words', 'words_alpha.txt')) as word_file:
        valid_words = set(word_file.read().split())

    return valid_words


def generate_names_set(words, set_length=SET_LENGTH, random_words_per_name=RANDOM_WORDS_PER_NAME):
    """
    Generates set of branch names.
    :param words: Set of words to sample from.
    :param set_length: Length of returned set.
    :param random_words_per_name: Amount of random words per branch name.
    :return:
    """
    names_set = []
    i = 0
    while set_length > i:
        random_name = '-'.join(random.sample(words, random_words_per_name))
        if random_name in names_set:
            continue
        names_set.append(random_name)
        i += 1
    return set(names_set)


def create_and_push_branch(repo, branch_name):
    """
    Creates a branch with the given name,
    :param repo: Git repo object.
    :param branch_name: Name of branch to create.
    :return:
    """

    git_cmd = repo.git
    git_cmd.checkout('HEAD', b=branch_name)
    file_path = os.path.join(repo.working_dir, "{0}.txt".format(branch_name))

    with open(file_path, 'w') as fd:
        fd.write(branch_name)

    repo.index.add(file_path)
    repo.index.commit(branch_name)
    git_cmd.push(['--set-upstream', 'origin', branch_name])


if __name__ == "__main__":
    main()

