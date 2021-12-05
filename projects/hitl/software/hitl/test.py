import threading
import time
from subprocess import run


class Tester:
    """Test class for figuring out how to run threads"""

    def __init__(self):
        global kill_threads
        kill_threads = False
        thread = threading.Thread(target=self.thread, kwargs={"callback": self.callback})
        thread.start()
        time.sleep(5)
        kill_threads = True

    def callback(self):
        print("Hello world!")
        time.sleep(1)

    def thread(self, callback):
        while not kill_threads:
            callback()


# t = Tester()  # should print hello 5 times then die

try:
    run("asdf")
except FileNotFoundError as e:
    print(type(e))
