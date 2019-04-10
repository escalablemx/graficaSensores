void setup()
{
 Serial.begin(9600); 
}

void loop()
{
  Serial.print(map(analogRead(0), 0, 1023, 0, 255));
  Serial.print(",");
  Serial.print(map(analogRead(1), 0, 1023, 0, 255));
    Serial.print(",");
  delay(60);

}
