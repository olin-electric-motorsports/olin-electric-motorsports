import pyserialarduino as arduinoserial
import time
arduino = arduinoserial.Arduino()

arduino.configure_pin(5, arduinoserial.PinTypes.OUTPUT)
arduino.configure_pin(6, arduinoserial.PinTypes.INPUT)
arduino.write_pin(6, arduinoserial.Values.HIGH)
time.sleep(0.5)
while(True):
    arduino.write_pin(5, arduinoserial.Values.HIGH)
    time.sleep(1)
    print(arduino.read_pin(6))
    time.sleep(1)
    arduino.write_pin(5, arduinoserial.Values.LOW)
    time.sleep(1)
    print(arduino.read_pin(6))
    input()
