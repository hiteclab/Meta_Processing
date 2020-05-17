
import processing.video.*;
boolean inivideo=false;

float paraciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0;

Movie movie;

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
background( 0 );

if(inivideo==false){
movie = new Movie(this, "HAL9001.wmv" ); 
movie.jump(0.0); 
movie.play(); 
inivideo=true; 
} 
image(movie, ratonX, ratonY);
}


void movieEvent(Movie m) { 
 m.read(); 
}
