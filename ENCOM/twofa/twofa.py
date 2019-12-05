import os


def check_2fa_login(password):
    # Need to get env variable
    twofa_password = os.environ["2FA"]

    # TODO here we'll check the 2FA password.
    # TODO Need to merge the rest of the work over from `grubbery-unopenly-unhushed`. But I'm just so lazy... 💤
    import hashlib
    m = hashlib.sha512()
    m.update(twofa_password.encode())
    return m.hexdigest() == 2
