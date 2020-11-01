void mousePressed(){
 click=mouseButton;

background( 255 );
for( ciclo =10; ciclo < 1920 ; ciclo = ciclo +50 ){
    line( ciclo, 0, ciclo, alto );
    }
for( ciclo =10; ciclo < 1080 ; ciclo = ciclo +50 ){
    line( 0, ciclo, ancho, ciclo );
    }

}
