// Generated with Meta_Processing Alpha 1.2
// https://github.com/hiteclab/Meta_Processing/releases

float ciclo=0,tecla=0,click=0,ratonX=0,ratonY=0,ancho=0,alto=0,esp=0;


 void settings() { 
size(displayWidth, displayHeight); 
}

void draw(){

 ratonX=mouseX; 
 ratonY=mouseY; 
 ancho=width; 
 alto=height; 

esp = int(loadStrings("http://192.168.4.1/?EDPIN=4")[0]);
if( esp > 0 ){
    background( #56CA38 );
    }
        else {
        background( #C73438 );
        }
}
