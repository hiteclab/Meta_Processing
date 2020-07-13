// Generated with Meta_Processing Alpha 1.2
// https://github.com/hiteclab/Meta_Processing/releases

import ddf.minim.*;

float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,px=0,py=0,contador=0;

Minim canal; 
AudioOutput nota;

 void settings() { 
size(displayWidth, displayHeight); 
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
