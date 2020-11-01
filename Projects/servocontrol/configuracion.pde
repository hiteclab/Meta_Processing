void setup(){

surface.setResizable(true); 
frameRate(60);
try { arduino = new Arduino(this, Arduino.list()[0], 57600); } catch (Exception e) { exit(); }

arduino.digitalWrite( 2, Arduino.HIGH );

}
