void mousePressed(){

AudioPlayer cancion = canal.loadFile( "melo.wav", 2048);
cancion.rewind(); 
cancion.play();

}
