def get_rx_messages(subs, messages):
    """
    Gets the received Messages from the list of messages, based on the subs
    dictionary.
    """
    rx_message_names = [d["name"] for d in subs]
    rx_messages = list(filter(lambda m: m.name in rx_message_names, messages))

    mobs = {}

    for m in subs:
        mobs[m["name"]] = m["mob"]

    return rx_messages, mobs
