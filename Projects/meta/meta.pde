
float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,px=0,py=22;


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
background( px );
px = px + 0.5;
}
