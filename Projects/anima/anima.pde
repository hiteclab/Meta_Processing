// Generated with Meta_Processing Alpha 1.2
// https://github.com/hiteclab/Meta_Processing/releases


float ciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,px=0,py=950;


 void settings() { 
size(displayWidth, displayHeight); 
}

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

background( px );
px = px + 0.5;
py = py - 0.5;
fill( #F2E138 );
ellipse( 200, py, 200, 200 );
fill( #0B259A );
rect( 0, 800, ancho, 400 );
}
