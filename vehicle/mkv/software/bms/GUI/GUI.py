import kivy
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.properties import ObjectProperty
from kivy.lang import Builder
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.floatlayout import FloatLayout
from kivy.properties import StringProperty
from functools import partial
from kivy.uix.widget import Widget
from kivy.core.window import Window
from kivy.graphics import *
import math
import random
Window.clearcolor = (1, 1, 1, 1)


Builder.load_string('''
<myCell>:
    canvas:
        Color: #Defines color of the PNG
            rgba: 1, 1, 1, 1
        Rectangle:
            source: "bat.png"
            pos: self.pos
            size: self.size

<Rec>:
    cellSize:2,2
    bgcolor:0.0,1.0,0.0,0.8
    canvas:
        Color:
            rgba:self.bgcolor
        Rectangle:
            pos:self.pos
            size:self.size
        Color: #Defines color of the PNG
            rgba: 1, 1, 1, 1
        Rectangle:
            source: "bat.png"
            pos: self.pos
            size: self.cellSize

    Label:
        id:cell_text
        color:0,0,0,1
        text:root.voltage
        text_size: root.width,None
        font_size:12
        halign:'center'
        size: self.texture_size
        pos:(root.pos[0],root.pos[1]+3)

<ButtonsGalore>:
    grid: Grid
    # BoxLayout:
    #     orientation: 'vertical'
    #     padding: 10
    # Button:
    #     text: 'Top'
    GridLayout:
        size_hint:0.6,1
        id: Grid
        cols: 16
        rows: 6
        spacing: 5
''')

# Configure architecture
segments = 6
series = 16
sTotal = segments * series

# Threshold colours
underVoltage = (255/255,240/255,36/255,1) # Yellow Less than 2.5V
justRight =    (21/255,232/255,26/255,1) # Green Between 2.5V and 4.2V
overVoltage =  (255/255,43/255,23/255,1) # Red  Above 4.2V


cValues = [100]*sTotal
for i in range(sTotal):
    cValues[i] = random.randrange(23,45)/10
print(cValues)

class ButtonsGalore(BoxLayout):
    grid = ObjectProperty(None)

class Rec(Widget):
    voltage = StringProperty()


class myCell(Widget):
    pass


class cellDisplay(Widget):

    def __init__(self, **kwargs):
        super(cellDisplay, self).__init__(**kwargs)
        # self.cells = 96*[Rectangle(pos=self.center,size=(self.width/4,self.height/4))]
        self.cells = sTotal*[Rec()]
        
        with self.canvas:

            Color(0,1,0,.5)
            for i in range(len(cValues)):
                val = cValues[i]
                self.cells[i] = Rec()

        self.bind(pos=self.update_canvas,
                  size=self.update_canvas)

    def update_canvas(self, *args):
        # Offsets and refernces for the cells locatons
        xCellBlockOffset = 45
        yCellBlockOffset = 10
        offSet = 0
        xPartition = (self.width -xCellBlockOffset)/series
        yPartition = (self.height-yCellBlockOffset)/segments
        hPartition = (self.height-yCellBlockOffset)/segments
        wPartition = (self.width -xCellBlockOffset)/(segments+4)
        # I don't want 2.5V and below to be invisible 
        # 300/340 is the height of the cell png before it goes above
        lowerVoltageOffset = (50/340)*(hPartition-30)
        fullCellHeight = (hPartition-30)*(250/340)
        for i in range(len(cValues)):
            # Retrive cell voltage
            val = cValues[i]
            x_loc = xPartition*(i%series)+xCellBlockOffset
            y_loc = yPartition*math.floor(i/series)+yCellBlockOffset
            pcFull = min(max((val-2.5),.01),1.8)/1.7
            h = fullCellHeight*pcFull+lowerVoltageOffset
            w = (wPartition-20)
            self.cells[i].pos=(x_loc+5,y_loc+5)
            self.cells[i].size=(w-2,h-2)
            self.cells[i].voltage = str(val)
            self.cells[i].cellSize = ((wPartition-20),(hPartition-30))

            # self.volts[i].pos=(x_loc,y_loc)
            # self.volts[i].text=str(val)

            if(val<2.5):
                self.cells[i].bgcolor = underVoltage
            elif(val<=4.2):
                self.cells[i].bgcolor = justRight
            else:
                self.cells[i].bgcolor = overVoltage




class OlinBMSApp(App):

    def disable(self, instance, *args):

        instance.disabled = True

    def update(self, instance, *args):

        instance.text = "I am disabled!"

    def build(self):
        con = FloatLayout(size_hint=(.7,1))
        con.add_widget(cellDisplay())        
        # return con
        g = ButtonsGalore()

        superBox = BoxLayout(orientation='horizontal',padding=10,spacing=10)
        controlBox = BoxLayout(orientation='vertical',size_hint=(.3,1))

        button1 = Button(text='One')
        button2 = Button(text='Two')
        mybtn =  Button(text="Do stuff...hopefully",size_hint=(1,1))
        controlBox.add_widget(mybtn)
        
        for i in range(6*16):
            g.grid.add_widget(myCell())
        
        superBox.add_widget(con)
        # superBox.add_widget(g)
        superBox.add_widget(controlBox)

        # mybtn.bind(on_press=partial(self.disable, mybtn))
        
        # mybtn.bind(on_press=partial(self.update, mybtn))

        return superBox




if __name__ == '__main__':
    OlinBMSApp().run()