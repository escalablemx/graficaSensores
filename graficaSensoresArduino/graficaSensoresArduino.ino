char valor='A';
char valor2='C';

void setup()
{
 Serial.begin(9600); 
 pinMode(2, OUTPUT);
 pinMode(3''''', OUTPUT);
}

void loop()
{
  Serial.print(map(analogRead(0), 0, 1023, 0, 255));
  Serial.print(",");
  Serial.print(map(analogRead(1), 0, 1023, 0, 255));
  Serial.print(",");
  delay(60);

  while( Serial.available() )
  {
    valor = Serial.read();     
    if(valor == 'A')
    digitalWrite(2, HIGH);
    if(valor == 'B')
    digitalWrite(2, LOW);
    
    if(valor == 'C')
    digitalWrite(3, HIGH);
    if(valor == 'D')
    digitalWrite(3, LOW);
  }
  
  
}
