#Uses Can to communicate via canfrom computer to car

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


