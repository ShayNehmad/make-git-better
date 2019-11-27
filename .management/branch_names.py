import random
import os

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

    print(generate_words_set(words))

    
def load_words():
    """
    Loads words from english-words repo.
    """
    with open(os.path.join('english-words', 'words_alpha.txt')) as word_file:
        valid_words = set(word_file.read().split())

    return valid_words


def generate_names_set(words, set_length=SET_LENGTH, random_words_per_name=RANDOM_WORDS_PER_NAME):
    """
    Generates set of branch names.
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


if __name__ == "__main__":
    main()

