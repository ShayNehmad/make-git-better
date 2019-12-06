import argparse
import pathlib
import random

import git


def parse_arguments():
    parser = argparse.ArgumentParser("Generate random branch names and push them to a repo.")
    parser.add_argument('--min', default=2, type=int,
                        help="Minimum word length per word in branch name. Non-inclusive.")
    parser.add_argument('--max', default=9, type=int,
                        help="Maximum word length per word in branch name. Non-inclusive.")
    parser.add_argument('--words', default=3, type=int, help="Amount of random words per branch name.")
    parser.add_argument('--branches', default=10, type=int, help="Amount of branches to push.")
    return parser.parse_args()


def main():
    args = parse_arguments()

    print("I'm the branch name generator.\nHere are some names for you:\n")
    words = load_words()
    print(len(words))

    # Filter to mostly normal pronounceable words
    words = set(filter(lambda x: args.min < len(x) < args.max, words))

    print(len(words))
    names_set = generate_names_set(words, args.branches, args.words)
    print(names_set)

    repo_dir = pathlib.Path(__file__).resolve().parent.parent
    repo = git.Repo(repo_dir)
    management_dir = repo_dir / '.management'

    for branch_name in names_set:
        create_and_push_branch(repo, branch_name, management_dir)
        print("Pushed {0}, checking out dev".format(branch_name))
        repo.git.checkout('dev')

    
def load_words():
    """
    Loads words from english-words repo.
    :return: Set of valid words.
    """
    words_repo_path = pathlib.PurePath(__file__).parent
    words_repo_path = str(words_repo_path / 'english-words' / 'words_alpha.txt')
    with open(words_repo_path, 'r') as word_file:
        valid_words = set(word_file.read().split())

    return valid_words


def generate_names_set(words, set_length, random_words_per_name):
    """
    Generates set of branch names.
    :param words: Set of words to sample from.
    :param set_length: Length of returned set.
    :param random_words_per_name: Amount of random words per branch name.
    :return: Set of branch names.
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


def create_and_push_branch(repo, branch_name, file_to_save_dir):
    """
    Creates a branch with the given name and pushes it to the remote repo.
    :param repo: Git repo object.
    :param branch_name: Name of branch to create.
    :param file_to_save_dir: Path of dir of file to save.
    """
    git_cmd = repo.git
    git_cmd.checkout('HEAD', b=branch_name)
    file_path = str(file_to_save_dir / "{0}.txt".format(branch_name))

    with open(file_path, 'w') as fd:
        fd.write(branch_name)

    repo.index.add(file_path)
    repo.index.commit(branch_name)
    repo.create_tag('{0}-tag'.format(branch_name))
    git_cmd.push(['--set-upstream', 'origin', branch_name])
    git_cmd.push(['origin', '--tags'])


if __name__ == "__main__":
    main()
