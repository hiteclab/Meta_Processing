// Generated with Meta_Processing Alpha 1.2b
// https://github.com/hiteclab/Meta_Processing/releases


import processing.serial.*;
import cc.arduino.*;

 Arduino arduino;

float ciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,angle=0,value=0;


 void settings() { 
size(displayWidth, displayHeight); 
}

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

arduino.pinMode(7, Arduino.SERVO);
arduino.servoWrite(7, int(angle));
value = arduino.analogRead(0);

angle = (value*180)/1024;
background( #3EDE38 );
text( ""+value+"", 50, 50 );
}
