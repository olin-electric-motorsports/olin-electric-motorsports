#Uses can to communicate via CAN from computer to car
import cantools 
import can
from pprint import pprint


#Get parameter value
def getter(paraN):
    send(0, paraN)
    paraV = recieve()
    print(f"The value of {paraN} is {paraV}")



#Setter Method
def setter(ParaN, ParaV):
    print(f"Setting {ParaN} to {ParaV}")
    send(1, paraN, )
   
    #Sending the values to set????
    send()


db = cantools.database.load_file('bazel-bin/vehicle/mkv/mkv.dbc')

vehicle_bus = can.interface.Bus(
bustype="slcan",
channel="/dev/tty/ACM0",
bitrate=500000
)
    
    def _send(funcType, paraName, paraVal=0):

    #Basically, each message in the DBC file should be the parameter's name
    # funcType = 0 means Getter
    # funcType = 1 means Setter

        if funcType == 0:
            message = [funcType, db.get_message_by_name(paraName)]
        elif funcType == 1:
            with vehicle_bus as bus:
            msg = can.Message(
            arbitration_id=0xC0FFEE, data=message.encode(), is_extended_id=True
            )

            try:
                bus.send(msg)
                print("Message sent on {}".format(bus.channel_info))
            except can.CanError:
                print("PANIC")

        
    def _recieve():
        message = vehicle_bus.recv()
        return db.decode_message(message.arbitration_id, message.data)




