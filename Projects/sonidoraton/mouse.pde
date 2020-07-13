void mousePressed(){
 click=mouseButton;

AudioPlayer cancion = canal.loadFile( "melo.wav", 2048);
cancion.rewind(); 
cancion.play();

}
