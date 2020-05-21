void keyPressed(){
if (keyCode==ESC)exit();
tecla=key;

textSize( 220 );
if( tecla == 'a' ){
    nota.playNote( "C4" );
    background( #2AD538 );
    text( "C", 500, 500 );
    }
if( tecla == 's' ){
    nota.playNote( "D4" );
    background( #C72538 );
    text( "D", 500, 500 );
    }
if( tecla == 'd' ){
    nota.playNote( "E4" );
    background( #3348AE );
    text( "E", 500, 500 );
    }
if( tecla == 'f' ){
    nota.playNote( "F4" );
    background( #FCD138 );
    text( "F", 500, 500 );
    }
if( tecla == 'g' ){
    nota.playNote( "G4" );
    background( #F48C0E );
    text( "G", 500, 500 );
    }
if( tecla == 'h' ){
    nota.playNote( "A4" );
    background( #EF1EC8 );
    text( "A", 500, 500 );
    }
if( tecla == 'j' ){
    nota.playNote( "B4" );
    background( #68B0A0 );
    text( "B", 500, 500 );
    }

}
