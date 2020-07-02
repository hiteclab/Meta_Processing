// Generated with Meta_Processing Alpha 1.2
// https://github.com/hiteclab/Meta_Processing/releases

float ciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0;

 void settings() { 
size(displayWidth, displayHeight); 
}

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

background( 0 );
PImage ima = loadImage("logolab.png"); image( ima, ratonX, ratonY );
}
