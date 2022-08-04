import warnings


def get_rx_messages(subs, messages):
    """
    Gets the received Messages from the list of messages, based on the subs
    dictionary.
    """
    # Check to see if subs has a message not specified in the DBC
    dbc_message_names = [dbc_message.name for dbc_message in messages]
    for message in subs:
        if message["name"] not in dbc_message_names:
            warnings.warn(
                f"Subscription message {message['name']} was not found in the dbc messages."
            )

    rx_message_names = [d['name'] for d in subs]
    rx_messages = list(filter(lambda m: m.name in rx_message_names, messages))
    filtered_rx_message_names = [rx_message.name for rx_message in rx_messages]

    masks = {}
    for message in subs:
        if message["name"] in filtered_rx_message_names:
            masks[message["name"]] = message.get("mask", 0x7FF)

    mobs = {}
    for m in subs:
        mobs[m["name"]] = m["mob"]

    return rx_messages, mobs, masks
