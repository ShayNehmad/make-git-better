### LICENSED TO ENCOM
### COPYRIGHT 1989
### AUTHOR: Ed Dillinger
import sys

def main():
    print("Trying to log in...")
    try:
        login()
    except:
        print("Something went wrong. This incident has been reported to ENCOM security >:(")
        sys.exit(1)

def login():
    # TODO: Merge the implementation from `albanian-novalike-shaup` branch. I forgot it there...
    raise NotImplementedError()

if __name__ == "__main__":
    main()
