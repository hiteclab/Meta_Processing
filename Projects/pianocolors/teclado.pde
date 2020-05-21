void keyPressed(){
if (keyCode==ESC)exit();
tecla=key;

if( tecla == 'a' ){
    nota.playNote( "C4" );
    background( #2AD538 );
    }
if( tecla == 's' ){
    nota.playNote( "D4" );
    background( #C72538 );
    }
if( tecla == 'd' ){
    nota.playNote( "E4" );
    background( #3348AE );
    }
if( tecla == 'f' ){
    nota.playNote( "F4" );
    background( #FCD138 );
    }
if( tecla == 'g' ){
    nota.playNote( "G4" );
    background( #F48C0E );
    }
if( tecla == 'h' ){
    nota.playNote( "A4" );
    background( #EF1EC8 );
    }
if( tecla == 'j' ){
    nota.playNote( "B4" );
    background( #57938D );
    }

}
