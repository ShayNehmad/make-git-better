import random
import os


def main():
    print("I'm the branch name generator.\nHere are some names for you:\n")
    # Think about changing this to movie names from imdb database
    words = load_words()
    print(len(words))

    # Filter to mostly normal pronounceable words
    words = set(filter(lambda x: 2 < len(x) < 9, words))

    print(len(words))

    while True:
        random_name = '-'.join(random.sample(words, 3))
        print(random_name)
        _ = input()

    
def load_words():
    with open(os.path.join('english-words', 'words_alpha.txt')) as word_file:
        valid_words = set(word_file.read().split())

    return valid_words


if __name__ == "__main__":
    main()
