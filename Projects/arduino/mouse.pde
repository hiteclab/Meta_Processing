void mousePressed(){
 click=mouseButton;

arduino.digitalWrite( 13, Arduino.HIGH );
arduino.pinMode(7, Arduino.SERVO);
arduino.servoWrite(7, 0);

}
