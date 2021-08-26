void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

int l_raw, r_raw;

int16_t rolling_avg = 0;

void loop() {
  l_raw = map(analogRead(1), 0, 1023, 0, 5000);
  r_raw = map(analogRead(0), 0, 1023, 0, 5000);
  
  Serial.print("l temp: ");
  // -10C: 1648 mV. 70C: 991mV
  Serial.print(map(l_raw, 1486, 1242, 10, 40));
  Serial.print(", r temp: ");
  Serial.println(map(r_raw, 1486, 1242, 10, 40));
//  Serial.println(analogRead(1));
  delay(10);
}
