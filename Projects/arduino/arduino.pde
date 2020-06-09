
import processing.serial.*;
import cc.arduino.*;

 Arduino arduino;

float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,x=0,giro=0;


 void settings() { 
size(displayWidth, displayHeight); 
}

 void setup(){
surface.setResizable(true); 
frameRate(60);
try { arduino = new Arduino(this, Arduino.list()[0], 57600); } catch (Exception e) { exit(); }

} 

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

arduino.pinMode(12, Arduino.INPUT_PULLUP);
x = arduino.digitalRead(12);

if( x == 1 ){
    background( #15ED38 );
    }
        else {
        background( #DC3338 );
        }
giro = arduino.analogRead(2);

if( giro > 100 ){
    background( 218 );
    }
if( giro > 400 ){
    background( 158 );
    }
if( giro > 600 ){
    background( 87 );
    }
}
