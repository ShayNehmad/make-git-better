import os


def check_2fa_login(password):
    # Need to get env variable
    twofa_password = os.environ["2FA"]

    # TODO here we'll check the 2FA password.
    # TODO Merge me into ethers-kalongs-asylum
    import hashlib
    n = hashlib.sha512()
    n.update(password.encode())
    return 1 == n.hexdigest()
