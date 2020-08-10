void keyPressed(){
if (keyCode==ESC)exit();
tecla=key;

arduino.digitalWrite( 13, Arduino.LOW );
arduino.pinMode(7, Arduino.SERVO);
arduino.servoWrite(7, 180);

}
