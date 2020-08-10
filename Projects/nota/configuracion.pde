void setup(){

surface.setResizable(true); 
frameRate(60);

 canal = new Minim(this);
 nota = canal.getLineOut();
 nota.setTempo( 60 );
 nota.playNote( 0.7, 0);


}
