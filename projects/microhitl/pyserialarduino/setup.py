from setuptools import setup

setup(name='pyserialarduino',
      version='0.1',
      description='Python wrapper for Arduino GeekFactory Shell Package',
      packages=['pyserialarduino'],
      install_requires=[
          'pyserial',
      ],
      zip_safe=False)