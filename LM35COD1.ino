int led=9; 
int temp; //declaramos nuestra variable de temperatura 
int temC;
boolean status=LOW;
void setup()
{
  Serial.begin(9600);
  pinMode(led,OUTPUT);
}
void loop()
{
  temp = analogRead(A0); //aca indicamos que temperatura viene de A0 el cual es el que resive la info
  //temp = (temp *0.634328358);
  temp =(temp/1024.0)*500; //aca hacemos la conversion de la informacion a numeros 
  
//temp = (5.0 * temp * 100.0)/1024.0;
  Serial.write(temp); //esto nos permite que processing lo pueda leer
  delay(1000);
  if(Serial.available()>0) //aca indicamos que el valor tiene que ser mayor que 0
  {
    byte dato = Serial.read();
    if(dato==65)
    {
      status=!status;
    }
    digitalWrite(led,status);
    }
  }
