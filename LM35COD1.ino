int led=9;
int temp;
int temC;
boolean status=LOW;
void setup()
{
  Serial.begin(9600);
  pinMode(led,OUTPUT);
}
void loop()
{
  temp = analogRead(A0);
  //temp = (temp *0.634328358);
  temp =(temp/1024.0)*500;
  
//temp = (5.0 * temp * 100.0)/1024.0;
  Serial.write(temp);
  delay(1000);
  if(Serial.available()>0)
  {
    byte dato = Serial.read();
    if(dato==65)
    {
      status=!status;
    }
    digitalWrite(led,status);
    }
  }
