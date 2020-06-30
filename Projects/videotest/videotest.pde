// Generated with Meta_Processing Alpha 1.2
// https://github.com/hiteclab/Meta_Processing/releases

import processing.video.*;
boolean inivideo=false;

float ciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0;
Movie movie;

 void settings() { 
size(displayWidth, displayHeight); 
}

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

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
