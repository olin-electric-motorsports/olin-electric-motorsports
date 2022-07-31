def get_rx_messages(subs, messages):
    """
    Gets the received Messages from the list of messages, based on the subs
    dictionary.
    """
    rx_message_names = [d["name"] for d in subs]
    rx_messages = list(filter(lambda m: m.name in rx_message_names, messages))
    masks = {message["name"]: message.get("mask", 0x7FF) for message in subs}

    mobs = {}

    for m in subs:
        mobs[m["name"]] = m["mob"]

    for mask_subscription_name in masks.keys():
        if mask_subscription_name not in rx_message_names:
            raise ValueError(
                "Found subscription message that is not in database messages."
            )

    return rx_messages, mobs, masks
