import os


def check_2fa_login(password):
    # Need to get env variable
    twofa_password = os.environ["2FA"]

    # TODO here we'll check the 2FA password
    return 1 == 2
