"""This setup script is a work in progress. The original setup script, 
found in `scripts`, works, but is not robust to different python setups.
I am writing this one according the the guidelines found here: 

https://godatadriven.com/blog/a-practical-guide-to-using-setup-py/

@author: awenstrup
"""

from setuptools import setup, find_packages

setup(
    name="hitl",
    version="0.1.0",
    packages=find_packages(include=["hitl", "hitl.*"]),
    install_requires=[
        "ft4222>=1.2.2",
        "myst-parser>=0.15.2",
        "python-can>=3.3.4",
        "pyserial>=3.4",
        "pytest>=6.1.1",
        "pytest-html>=2.1.1",
        "pyusb>=1.1.0",
        "cantools>=35.5.0",
    ],
)
