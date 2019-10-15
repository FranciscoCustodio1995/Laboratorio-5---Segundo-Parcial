   import processing.serial.*; //esta es la libreria 
   Serial port;
   PrintWriter output; //con este codigo podemos crear el Block de Notas y escribir en el cuando lo llamemos
   
   int valor; //Nuestro valor que nos mandaran de Arduino
   void setup()
   {
     println(Serial.list());
     port = new Serial(this, "COM1", 9600);
       output = createWriter("temperatura_datos.txt"); //aca Creamos el Block de notas
       size(390,200);
   }
 void draw(){
   if (port.available() > 0) //creamos una condicion que no deja que el valor sea menor que 0
   {
     delay(1000);
     valor=port.read(); //con esto leemos nuestro valor mandado de arduino
   }
   background(0);
fill(255);
    textSize(30);
    text("Temperatura =" , 50,100); //aqui escribimos lo que queremos que processing nos grafique
    text(valor,276,100);
    text("  °C",320,100);
    output.print(valor + "     °C     "); //aca escribimos lo que queremos que ponga en el block d enotas
    output.print(hour()+":");
    output.print(minute()+":");
    output.println(second());
    output.println("");
    }
