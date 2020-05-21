
import ddf.minim.*;

float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,px=0,py=0,contador=0;

Minim canal; 
AudioOutput nota;

 void settings() { 
fullScreen(); 
}

 void setup(){ 
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

noStroke();
fill( #5ADB38 );
contador = contador + 0.1;
if( contador > 5 ){
    px = random(1900);
    py = random(1040);
    rect( px, py, 40, 40 );
    contador = 0;
    }
}
