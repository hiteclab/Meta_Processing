
import ddf.minim.*;

float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0;
Minim canal; 
AudioOutput nota;

 void settings() { 
size(displayWidth, displayHeight); 
}

 void setup(){
surface.setResizable(true); 
frameRate(60);
 canal = new Minim(this);
 nota = canal.getLineOut();
 nota.setTempo( 60 );
 nota.playNote( 0.7, 0);
} 

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 
 tecla=key; 
 click=mouseButton;

}
