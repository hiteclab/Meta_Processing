
float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0;

 void settings() { 
size(displayWidth, displayHeight); 
}

 void setup(){
surface.setResizable(true); 
frameRate(60);
} 

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 
 tecla=key; 
 click=mouseButton;
background( 1 );
fill( #DE980A );
rect( 0, 750, ancho, 500 );
fill( 253 );
ellipse( 1600, 400, 300, 300 );
fill( #78591B );
triangle( 600, 1300, 1600, 400, 2400, 1300 );
}
