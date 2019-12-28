import os


def check_2fa_login(password):
    # Need to get env variable
    twofa_password = os.environ["TWO_FA"]

    # TODO here we'll check the 2FA password.
    # We need to check the 2FA password from the environment variable against the user-provided password. Also, I heard that using hashes is secure - let's do that!

    # TODO Need to merge the rest of the work over from `grubbery-unopenly-unhushed`. But I'm just so lazy... 💤
    import hashlib
    m = hashlib.sha512()
    n = hashlib.sha512()
    m.update(twofa_password.encode())
    n.update(password.encode())
    return m.hexdigest() == n.hexdigest()

