// Generated with Meta_Processing Alpha 1.2
// https://github.com/hiteclab/Meta_Processing/releases


float ciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,c=0;


 void settings() { 
size(displayWidth, displayHeight); 
}

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

background( 0 );
for( ciclo =0; ciclo < 300 ; ciclo = ciclo +30 ){
    c = random(255);
    fill( c );
    rect( ciclo, 80, 20, 20 );
    }
}
