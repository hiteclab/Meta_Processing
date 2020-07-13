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

background( #1FD238 );
if( ratonX > 100 )
if( ratonX < 200 )
if( ratonY > 100 )
if( ratonY < 200 )
{
    rect( 100, 100, 100, 100 );
    }
}
