import serial
import time
import math

class Cell(object):
	def __init__(self, segment, cell, voltage):
		self.segment = segment
		self.cell = cell
		self.voltage = voltage
		self.temp = 0
		self.temp_voltage = 0
		self.vref2 = 0
		self.discharge = 0

	def display(self):
		print "Seg: " + str(self.segment) + " Cell: " + str(self.cell) + " V: " + str(self.voltage) + " T: " + str(self.temp)

	def voltage_to_temp(self,voltage):
	    beta = 3950.0
	    R_0 = 100000.0
	    R_top = 100000.0
	    T_0 = 273 + 25
	    #R = (self.vref2 * R_top / voltage) - R_top
	    try: 
	    	R = voltage * R_top/(self.vref2 - voltage)
	    except:
	    	return 0.0
	    if R < 0: #can't take the log of a negative number
	    	R = 0.0001
	    #print "Vref2: " + str(self.vref2) + " V: "+str(voltage)+" R: "+str(R)
	    temp = beta / (math.log(R) - math.log(R_0) + (beta / T_0)) - 273	
	    return temp


class CAN(object):

	def __init__(self, port):
		self.ser = serial.Serial(port, 115200)
		self.ser.readline()
		foo = Cell(None,None,0)
		self.battery = [[foo for j in range(12)] for i in range(6)]

	def run(self):
		count = 0
		while True:
			count += 1
			if count >= 1:
				count = 0
				self.display()
			line = self.ser.readline()
			can_id = line[4:8]
			if (can_id == '0x13'): #voltage message
				message = line.split("MSG:", 1)[1]
				bytes = message.split(",")[:8]
				segment = int(bytes[0],0)
				cell_num = int(bytes[1],0)
				for i in range(3):
					volts = (int(bytes[(i+1)*2],0)<<8)|int(bytes[(i+1)*2+1],0)
					cell = Cell(segment,cell_num,volts/10000.0)
					#cell.display()
					if self.battery[segment][cell_num].cell is None:
						self.battery[segment][cell_num] = cell
					else:
						self.battery[segment][cell_num].cell = cell_num
						self.battery[segment][cell_num].segment = segment
						self.battery[segment][cell_num].voltage = volts/10000.0
					cell_num += 1

			if (can_id == '0x14'): #temperature message
				message = line.split("MSG:", 1)[1]
				bytes = message.split(",")[:8]
				segment = int(bytes[0],0)
				cell_num = int(bytes[1],0)
				vref2 = ((int(bytes[6],0)<<8)|int(bytes[7],0))/10000.0
				for i in range(2):
					temp_volt = (int(bytes[(i+1)*2],0)<<8)|int(bytes[(i+1)*2+1],0)
					temp_volt = temp_volt/10000.0
					#print "temp_volt: " + str(temp_volt)
					if not self.battery[segment][cell_num].cell is None:
						cell = self.battery[segment][cell_num]
						cell.vref2 = vref2
						cell.temp_voltage = temp_volt
						cell.temp = cell.voltage_to_temp(temp_volt)
					cell_num += 1

			if (can_id == '0x15'):
				message = line.split("MSG:", 1)[1]
				bytes = message.split(",")[:8]
				section = int(bytes[0],0)
				segment = section * 3
				for i in range(3):
					discharge = (int(bytes[i*2 + 1],0)<<8)|int(bytes[i*2 + 2],0)
					for cell_num in range(12):
						if not self.battery[segment][cell_num].cell is None:
							cell = self.battery[segment][cell_num]
							cell.discharge = 1 if ((discharge >> cell_num) & 1) else 0 #'Yes' if fruit == 'Apple' else 'No'
					segment += 1





	def display(self):
		for segment in self.battery:
			#bar = [SOME EXPRESSION for item in some_iterable]
			v_list =  [("D* " if cell.discharge else "")+("%0.3f" % cell.voltage)+"V "+("%0.3f" % cell.temp)+"C |" for cell in segment]
			string = " ".join(str(x) for x in v_list)
			print str(segment[0].segment) + ": "+("%0.3f" % segment[0].vref2)+"Vref2 | " + string
		print "-----------------------------"





if __name__ == '__main__':
  can = CAN('/dev/cu.usbmodem1411')
  can.run()

	#voltages = [1.5345, 1.5456, 1.5454, 1.5406, 1.5414, 1.5434, 1.5547, 1.5527, 1.5454, 1.5445, 1.5554]

	#temps = [voltage_to_temp(voltage) for voltage in voltages]