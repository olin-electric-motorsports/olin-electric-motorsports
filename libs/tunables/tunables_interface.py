#This is the file that pulls everything together. This will run on the host computer's terminal and will help guide the user through the different options. 



def tunables_main():
    isRunning = True
    

    print(" \n This is the Tunables Parameters program")
     
    while (isRunning):

        #Step 1. Choose whether it's User-designed thresholds or MC values
        while (isRunning):
            usrInput = chooseType();
            if usrInput == 0:
                break
                #Use tunables_array 
            elif usrInput == 1:
                break
                #Use MC commands
            elif usrInput == 2:
                isRunning = False
                break
            else:
                pass
        

        #Step 2. Choose what you want for the parameter
        while (isRunning):
            choice = int(input("Choose what you want to do: \n (1) Get a Parameter Value \n (2) Measure Value from Sensor \n (3) Change Parameter Value \n (4) Quit \n" ))
            if choice == 1:
                #Getter Method
                paraName= input("Type in the parameter's name to get the value of it: \n")
            elif choice == 2:
                #Measuring
                paraName = input("Type in the parameter's name to measure: \n" )
            elif choice ==3:
                #Setter Method
                paraName = input("Type in the parameter's name to change: \n")
                paraValue = input(f"Type in the new {paraName} value you want: \n")
            elif choice == 4:
                print("Quitting")
                isRunning = False
                break
            else:
                pass

            #Step 3. Submit the values to CAN
            #Example Code for Cantools: cantools(paraName)

        



    #Quitting
    print(" \n Thank you for using Tunable Parameters")


             

#Functions
#*************************************************************************************************************
#Decide whether we're using  User-Designed Thresholds or Motor Controller-Specific Values 
def chooseType():
    typeChoice = int(input (" \n Choose type of parameter: \n (1)  User-Designed Thresholds \n (2) Motor Controller-Specific Values \n (3) Quit \n"))
    if ( typeChoice == 1):
        print("You chose User-Designed Thresholds")
        return 0
    elif (typeChoice == 2):
        print("You chose Motor Controller-Specific Values")
        return 1
    elif (typeChoice ==3):
        return 2
    else:
        print("Sorry, that's not a valid choice.")
        return -1






#main
tunables_main()

