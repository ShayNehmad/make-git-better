# -*- coding: utf-8 -*-
import os


def check_2fa_login(password):
    """
    Implemented by Ed Dillinger.

    I don't know much about cryptography, or security...
    But I heard hashing was good. Right? 🤔
    """
    twofa_password = os.environ["TWO_FA"]

    import hashlib
    m = hashlib.sha512()
    m.update(twofa_password.encode())
    n = hashlib.sha512()
    n.update(password.encode())
    return m.hexdigest() == n.hexdigest()
