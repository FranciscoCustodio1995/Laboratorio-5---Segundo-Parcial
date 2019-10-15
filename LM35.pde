   import processing.serial.*;
   Serial port;
   PrintWriter output;
   
   int valor;
   void setup()
   {
     println(Serial.list());
     port = new Serial(this, "COM1", 9600);
       output = createWriter("temperatura_datos.txt");
       size(390,200);
   }
 void draw(){
   if (port.available() > 0)
   {
     delay(1000);
     valor=port.read();
   }
   background(0);
fill(255);
    textSize(30);
    text("Temperatura =" , 50,100);
    text(valor,276,100);
    text("  °C",320,100);
    output.print(valor + "     °C     ");
    output.print(hour()+":");
    output.print(minute()+":");
    output.println(second());
    output.println("");
    }
