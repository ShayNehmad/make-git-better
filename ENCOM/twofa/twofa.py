# -*- coding: utf-8 -*-
import os


def check_2fa_login(password):
    """
    Implemented by Ed Dillinger. 

    I don't know much about cryptography, or security...
    But I heard hashing was good. Right? 🤔
    """
    # Get the plaintext password from the environment variable
    twofa_password = os.environ["TWO_FA"]

    # We need to check twofa_password from the environment variable 
    # against the user-provided password. 
    # Also, I heard that using hashes is secure - let's hash both of them before comparing them!

    import hashlib
    m = hashlib.sha512()
    m.update(twofa_password.encode())
    n = hashlib.sha512()
    n.update(password.encode())
    return m.hexdigest() == n.hexdigest()
