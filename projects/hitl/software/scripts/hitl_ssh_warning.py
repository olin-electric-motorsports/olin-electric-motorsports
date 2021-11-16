import os
import warnings
if os.environ["SSH_CONNECTION"] and os.environ["MANUAL"]:
    warnings.warn("A directly connected user is currently active on the Action Runner.")