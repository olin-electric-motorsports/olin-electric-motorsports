// objective - randomly generate data stream for serial on dev/ttyUSB0
int i =5;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  while(i<100){
    Serial.println(random(i-5,i+5));
    i+=1; 
    delay(10);
  }
  i = 5;
}
