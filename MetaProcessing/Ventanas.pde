//---------------------------
//----- INSTRUCCIONES -------
//---------------------------
class PWindow3 extends PApplet {
  PWindow3() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    surface.setTitle("");
  }

  int nargu, lastid, posy;
  int instruancho;
  int x=0, y=0;
  char nota = 'C'; 
  int octava =4;
  int pin;
  int angulo;
  boolean falsetrue=false;
  String px, py, ancho, alto, pxt3, pyt3, valor1, valor2, condicional, limitepara;
  int r, g, b=56, rf=250, gf, bf, gray, grayf=50;
  String c, instru;
  JSONObject objeto;
  int argumentos= 1000000;
  int activado=-1;
  int nvaragu1, nvaragu2, nvaragu3, nvaragu4, nvaragu5, nvaragu6;
  PImage logo;
  PFont myFont;
  int logox=0, logo2x=1000;
  boolean keyif=false, mousebif=false;

  void settings() {

    leelinea(lineaclik);
    instru = line;
    if (idlee==0)instru = objetoactual.getString("comentario");
    nargu = nargumentos;
    lastid =idlee;
    if (opening==true)lastid=1;
    if (seleidio==true)lastid=1;
    if (agregarvar==true)lastid=-9;
    if (selectvarini ==true)lastid=-9;
    if (config==true)lastid=-9;
    objeto = objetoactual;
    if (lastid==-1) size(ventatamx, 630, JAVA2D); 
    else { 
      size(ventatamx, 330);
      if (lastid==98|| lastid==102||lastid==115) size(ventatamx, 400);
      else
        if (lastid==0 || lastid==110 ) size(1024, 150); 
        else
          if (proyecto == true) size(500, 150);
          else
            if (opening==true)size(ventatamx, 550, JAVA2D);
    }
  }

  void setup() {
    surface.setResizable(true); 
    background(150);
    logo = loadImage(codefolder+"/logos.png");
    fill(255);
    textSize(18);
    instruancho= int(textWidth(""+instru));
    if (id==0) c = objeto.getString("comentario");

    textFont(createFont("Arial Unicode MS", 17));
  }

  void draw() {
    background(0);
    posy= mouseY-mouseY % 20;
    if (lastid == 102 || lastid == 115 || lastid == 98)colorselector();
    if (lastid == 114) positam();
    if (lastid == 101) positam();
    if (lastid == 0) coment();
    if (agregarvar== true) variable();
    if (selectvarini == true) variableini();
    if (lastid == 110) nota();
    if (lastid == 10 || lastid == -10) salidadigital();
    if (lastid == 11 || lastid == -11) entradadigital();
    if (lastid == 12 || lastid == -12) entradaanalogica();
    if (lastid == 13 || lastid == -13) servo();
    if (lastid == 108) linea();
    if (lastid == 100) sonido();
    if (lastid == 51) triangulo();
    if (lastid == 109 || lastid == 118 ) imagen();
    if (lastid == 116) texto();
    if (lastid == 117) tamtexto();
    if (lastid == 97) aleatorio(); // aleatorio
    if (lastid == 61) aleatorio(); // asignar
    if (lastid == 62) aleatorio(); // sumar
    if (lastid == 63) aleatorio(); // restar
    if (lastid == 64) aleatorio(); // multiplicar
    if (lastid == 65) aleatorio(); // dividir
    if (lastid == 66) formula(); // formula
    if (lastid == 40) formula(); // formula
    if (lastid == 105) condicion();
    if (lastid == -1) instruccion();
    if (lastid == 99) capsula();
    if (lastid == 111) para();
    if (opening==true) splash();
    if (seleidio==true) idioma();
    if ( proyecto == true) proyecto();
    if (config==true)config();
    if (lastid == -102 || lastid == -115) {
      background(200);
      fill(80);
      if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
      else text(""+idiomaactual.get(str(lastid)), 10, 20);
    }
  }

  void mousePressed() {

    // Seleccionar idioma
    if (seleidio==true) {

      // boton idioma Español
      if (posy==40) {
        idiomagui = loadJSONObject(codefolder+"/lang/Esp/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Esp/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Esp/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "0";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Frances
      if (posy==60) {
        idiomagui = loadJSONObject(codefolder+"/lang/Fr/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Fr/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Fr/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "1";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }

      // boton idioma Hindi
      if (posy==80) {
        idiomagui = loadJSONObject(codefolder+"/lang/Hi/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Hi/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Hi/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "2";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Japones
      if (posy==100) {
        idiomagui = loadJSONObject(codefolder+"/lang/Jp/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Jp/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Jp/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "3";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Italiano
      if (posy==120) {
        idiomagui = loadJSONObject(codefolder+"/lang/Ita/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Ita/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Ita/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "4";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Chino
      if (posy==140) {
        idiomagui = loadJSONObject(codefolder+"/lang/Ch/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Ch/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Ch/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "5";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Portugues
      if (posy==160) {
        idiomagui = loadJSONObject(codefolder+"/lang/Prt/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Prt/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Prt/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "6";
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Ingles
      if (posy==180) {
        idiomagui = loadJSONObject(codefolder+"/lang/Eng/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Eng/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Eng/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "7";

        /*
                //varenterasnom.set(0,"i");
         varenterasnom.set(1,idiomagui.getString("tecla")); 
         varenterasnom.set(2,idiomagui.getString("click")); 
         varenterasnom.set(3,idiomagui.getString("ratonX")); 
         varenterasnom.set(4,idiomagui.getString("ratonY")); 
         varenterasnom.set(5,idiomagui.getString("ancho")); 
         varenterasnom.set(6,idiomagui.getString("alto")); 
         */

        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }
      // boton idioma Nuevo
      if (posy==200) {
        idiomagui = loadJSONObject(codefolder+"/lang/Newlang/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Newlang/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Newlang/instrucciones.json");
        String[] last0 = new String[1];
        last0 = expand(last0, 1);
        last0[0] =  "8";        
        saveStrings(codefolder+"/lang/lastlang.txt", last0 );
      }      


      seleidio=false;
      exit();
      surface.setVisible(false);
    } // Fin Seleccionar idioma

    // capsula de código
    if (lastid == 99) {

      if (mouseY>120 && mouseY<140) muestrabloque=true;

      if (mouseY>160 && mouseY<180) muestrabloque=false; 

      if (posy==40)argumentos = 1000001;
      if (posy==80)argumentos = 1000010;



      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar Capsula código
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";

        renuevaobjeto.setString("capsula", temp);
        renuevaobjeto.setInt("id", 99);
        renuevaobjeto.setString("final", px);
        renuevaobjeto.setBoolean("visible", muestrabloque);
        linea = "//"+idiomagui.getString("código")+": "+temp;


        renuevaobjeto.setString("pde", linea);
        

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    }

    // boton var color
    if (lastid == 102 || lastid == 115 || lastid == 98) {

      if (mouseX>280 && mouseX <312 && mouseY > 10 && mouseY <30) {
        variables = new PWindow4();
      }
    }    


    ///////////////////////
    // agregar instrucción
    ///////////////////////

    if (lastid==-1) {
      px="";
      py="";
      ancho="";
      alto="";
      pxt3 ="";
      pyt3 ="";
      valor1 ="";
      valor2 ="";
      condicional ="";
      temp ="";
      if (mouseX<width/3) {
        if (posy==20) { // opcion comentario
          lastid=0;
          instru="";
        }
        if (posy==60) { // opcion linea
          lastid=108;
        }
        if (posy==80) { // opcion triangulo
          lastid=51;
        }
        if (posy==100) { // opcion rectangulo
          lastid=114;
        }
        if (posy==120) { // opcion elipse
          lastid=101;
        }
        if (posy==140) { // opcion texto
          lastid=116;
        }
        if (posy==160) { // opcion imagen
          lastid=109;
        }
        if (posy==200) { // opcion fondo
          lastid=98;
        }
        if (posy==220) { // opcion colorlinea
          lastid=115;
        }
        if (posy==240) { // opcion relleno
          lastid=102;
        }
        if (posy==260) { // opcion sinrelleno
          JSONObject renuevaobjeto = new JSONObject();
          String linea ="";
          if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
          if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
          if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
          if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
          renuevaobjeto.setString("instruccion", "sinrelleno");
          renuevaobjeto.setInt("id", -102);
          linea = "noFill();";
          renuevaobjeto.setString("pde", linea);
          if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
          if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
          if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
          if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
          exit();
          surface.setVisible(false);
        }
        if (posy==280) { // opcion sinlinea
          JSONObject renuevaobjeto = new JSONObject();
          String linea ="";
          if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
          if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
          if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
          if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
          renuevaobjeto.setString("instruccion", "sinlinea");
          renuevaobjeto.setInt("id", -115);
          linea = "noStroke();";
          renuevaobjeto.setString("pde", linea);
          if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
          if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
          if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
          if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
          exit();
          surface.setVisible(false);
        }
        if (posy==300) { // opcion tamtexto
          lastid=117;
        }
        if (posy==340) { // opcion tocanota
          lastid=110;
        }
        if (posy==360) { // opcion sonido
          lastid=100;
        }
        if (posy==380) { // opcion video
          lastid=118;
        }
        if (posy==420) { // opcion if
          lastid=105;
        }  
        if (posy==440) { // opcion para
          lastid=111;
        }
        if (posy==480) { // opcion asignar
          lastid=61;
        }
        if (posy==500) { // opcion sumar
          lastid=62;
        }
        if (posy==520) { // opcion restar
          lastid=63;
        }
        if (posy==540) { // opcion multiplicar
          lastid=64;
        }
        if (posy==560) { // opcion dividir
          lastid=65;
        }
        if (posy==580) { // opcion aleatorio
          lastid=97;
        }
        if (posy==600) { // opcion formula
          lastid=66;
          instru="";
        }
      } // opciones primera columna
      if (mouseX>width/3) {
        if (posy==20) { // opcion salida ditital
          lastid=10;
        }
        if (posy==40) { // opcion entrada digital
          lastid=11;
        }
        if (posy==60) { // opcion entrada analogica
          lastid=12;
        }    
        if (posy==80) { // opcion servo
          lastid=13;
        } 
        if (posy==120) { // opcion salida ditital
          lastid=-10;
        }
        if (posy==140) { // opcion entrada digital
          lastid=-11;
        }
        if (posy==160) { // opcion entrada analogica
          lastid=-12;
        }    
        if (posy==180) { // opcion servo
          lastid=-13;
        } 
        if (posy==220) { // opcion código nativo
          lastid=40;
          instru="";
        } 

        /*
          if (posy==140) { // opcion bloque código
         lastid=99;
         if (objeto.isNull("capsula") == false){
         temp= ""+objeto.get("capsual");
         px= ""+objeto.get("final");
         } else{ 
         temp = "";
         px = str(lineaactual+1);
         }
         } 
         */
      }
    } // Fin agregar instrucción

    ///////////////////////////////////////////    

    if (positam==true) { 
      if (posy== 40)  argumentos= 1000001; // casilla x
      if (posy== 80)  argumentos= 1000010; // casilla y
      if (posy== 120) argumentos= 1000100; // casilla ancho
      if (posy== 160) argumentos= 1001000; // casilla alto
      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }


      ///* // botones  Var ARGUMENTO 1
      if (posy== 40 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 40 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }

      ///* // botón Var ARGUMENTO 2
      if (posy== 80 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar2=true; 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 80 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        py = "";
      }

      ///* // botón Var ARGUMENTO 3
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar3=true;
        lastargu=3;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar3=true; 
          varclicked=false;
        } else arguvar3=false;
      } 

      ///* // botón  # ARGUMENTO 3
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar3=false;
        lastargu=3;
        ancho = "";
      }

      ///* // botón Var ARGUMENTO 4
      if (posy== 160 && mouseX>293 && mouseX<325) {
        arguvar4=true;
        lastargu=4;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar4=true; 
          varclicked=false;
        } else arguvar4=false;
      } 

      ///* // botón  # ARGUMENTO 4
      if (posy== 160 && mouseX>272 && mouseX<287) {
        arguvar4=false;
        lastargu=4;
        alto = "";
      }

      // boton aplicar cuadrado y elipse
      if (lastid!= 108 && lastid!= 109 && posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        
        if (lastid==114) {
          renuevaobjeto.setString("instruccion", "rectangulo");
          linea = "rect( "+px+", "+py+", "+ancho+", "+alto+" );";
        }
        if (lastid==101) {
          renuevaobjeto.setString("instruccion", "elipse");
          linea = "ellipse( "+px+", "+py+", "+ancho+", "+alto+" );";
        }
        renuevaobjeto.setInt("id", lastid);

        if (arguvar1==false) renuevaobjeto.setInt("px", int(px));

        if (arguvar1==true) renuevaobjeto.setString("pxv", px);


        if (arguvar2==false) renuevaobjeto.setInt("py", int(py));

        if (arguvar2==true) renuevaobjeto.setString("pyv", py);


        if (arguvar3==false) renuevaobjeto.setInt("tx", int(ancho));

        if (arguvar3==true) renuevaobjeto.setString("txv", ancho);


        if (arguvar4==false) renuevaobjeto.setInt("ty", int(alto));

        if (arguvar4==true) renuevaobjeto.setString("tyv", alto);

        renuevaobjeto.setString("pde", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin positam

    /////////////////////////////////////////////

    // boton aplicar linea
    if (lastid== 108 && posy== 220 && mouseX>170 && mouseX<260) {
      JSONObject renuevaobjeto = new JSONObject();
      String linea ="";
      linea = "line( "+px+", "+py+", "+ancho+", "+alto+" );";
      if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
      if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
      if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
      if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
      renuevaobjeto.setString("instruccion", "linea");
      renuevaobjeto.setInt("id", lastid);
      if (arguvar1==false)renuevaobjeto.setInt("pxt1", int(px));
      if (arguvar1==true)renuevaobjeto.setString("pxt1v", px);

      if (arguvar2==false)renuevaobjeto.setInt("pyt1", int(py));
      if (arguvar2==true)renuevaobjeto.setString("pyt1v", py);

      if (arguvar3==false)renuevaobjeto.setInt("pxt2", int(ancho));
      if (arguvar3==true)renuevaobjeto.setString("pxt2v", ancho);

      if (arguvar4==false)renuevaobjeto.setInt("pyt2", int(alto));
      if (arguvar4==true)renuevaobjeto.setString("pyt2v", alto);

      renuevaobjeto.setString("pde", linea);

      if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
      if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
      if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
      if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
      ventana=false;
      exit();
      surface.setVisible(false);
    }

    //////////////////////////////////////////////////

    if (para==true) {
      
      
      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      
      // casillas texto
      if (posy== 40)   argumentos= 1000001; // casilla argumento 1
      if (posy== 80 && mouseX>280) argumentos= 1000010; // casilla argumento 2
      if (posy== 120) argumentos= 1000100; // casilla argumento 2

      // condiconales
      if (posy== 80 && mouseX>169 && mouseX<184) condicional="<";
      if (posy== 80 && mouseX>189 && mouseX<204) condicional=">";
      if (posy== 80 && mouseX>209 && mouseX<234) condicional="<=";
      if (posy== 80 && mouseX>239 && mouseX<264) condicional=">=";
      
      
      // boton aplicar PARA
      if (lastid!= 109 && posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        renuevaobjeto.setString("instruccion", "para");

        linea = "for( ciclo ="+valor1+"; ";
        linea = linea+"ciclo "+condicional+" "+ limitepara+" ;";
        linea = linea+" ciclo = ciclo +"+valor2+" ){";

        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("valorini", int(valor1));

        renuevaobjeto.setString("condicion", condicional);

        renuevaobjeto.setInt("incremento", int(valor2));
        renuevaobjeto.setInt("valorfinal", int(limitepara));

        renuevaobjeto.setString("pde", linea);
        //println(renuevaobjeto);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
      
    }

    //////////////////////////////////////////////////

    if (condicion==true) { 
      if (posy== 40)  argumentos= 1000001; // casilla argumento 1
      if (posy== 120 && keyif==false && mousebif==false) argumentos= 1000010; // casilla argumento 2

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }


      ///* // botones  Var ARGUMENTO 1
      if (posy== 40 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 40 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        valor1 = "";
      }

      // condicional.equals("=") 
      if ( posy== 80 && mouseX>170 && mouseX<185) {
        condicional = "=";
      } 

      // condicional.equals("<")
      if ( posy== 80 && mouseX>190 && mouseX<205) {
        condicional = "<";
      } 

      // condicional.equals(">")
      if ( posy== 80 && mouseX>210 && mouseX<225) {
        condicional = ">";
      } 

      // condicional.equals("!=")
      if ( posy== 80 && mouseX>230 && mouseX<255) {
        condicional = "!=";
      } 

      ///* // botón Var ARGUMENTO 2
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        mousebif = false;
        keyif = false;
        variables = new PWindow4();
        if (varclicked==true) {
          arguvar2=true; 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        valor2 = "";
        mousebif = false;
        keyif = false;
      }

      // boton mouseButton
      if (posy== 120 && mouseX>352 && mouseX<368) {
        arguvar2=false;
        mousebif = true;
        keyif = false;
        if (mouseButton == LEFT) valor2 = "1100";
        if (mouseButton == CENTER) valor2 = "1010";
        if (mouseButton == RIGHT) valor2 = "1001";
      }

      // boton Caracter
      if (posy== 120 && mouseX>331 && mouseX<346) {
        arguvar2=false;
        argumentos= 1000100;
        valor2 = "";
        keyif = true;
      }

      // boton aplicar CONDICION
      if (lastid!= 109 && posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "si");

        linea = "if( "+valor1+" ";
        if (condicional.equals("=")) linea = linea+"=="; 
        else linea = linea+condicional;
        linea = linea+" "+valor2+" ){";

        renuevaobjeto.setInt("id", lastid);
        if (arguvar1==false)renuevaobjeto.setInt("valor1", int(valor1));
        if (arguvar1==true)renuevaobjeto.setString("valor1v", valor1);

        renuevaobjeto.setString("condicion", condicional);

        if (arguvar2==false)renuevaobjeto.setString("valor2", valor2);
        if (arguvar2==true)renuevaobjeto.setString("valor2v", valor2);
        //if (keyif == true)renuevaobjeto.setInt("valor2", int(valor2.charAt(0)));
        if (keyif == true)renuevaobjeto.setString("valor2", valor2);

        if (objeto.getInt("id") != -1) {
          renuevaobjeto.setBoolean("visible", objeto.getBoolean("visible"));
        } else {
          renuevaobjeto.setBoolean("visible", true);
        }

        renuevaobjeto.setString("pde", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin condicion

    ///////////////////////////////////////////////////////////////////////////



    if (lastid == 10 || lastid == 11 || lastid == 12 || lastid == 13 || lastid == -10 || lastid == -11 || lastid == -12 || lastid == -13) {  // ARDUINO

      //if (posy== 80 )  argumentos= 1000010; // casilla y


      if (lastid==10 && posy==40 || lastid==-10 && posy==40) { // seleccionar casilla salidadigital
        if (x==100) {
          falsetrue=!falsetrue; 
          pin =0;
        } // pin 0
        if (x==120) {
          falsetrue=!falsetrue; 
          pin =1;
        } // pin 1
        if (x==140) {
          falsetrue=!falsetrue; 
          pin =2;
        } // pin 2
        if (x==160) {
          falsetrue=!falsetrue; 
          pin =3;
        } // pin 3
        if (x==180) {
          falsetrue=!falsetrue; 
          pin =4;
        } // pin 4
        if (x==200) {
          falsetrue=!falsetrue; 
          pin =5;
        } // pin 5
        if (x==220) {
          falsetrue=!falsetrue; 
          pin =6;
        } // pin 6
        if (x==240) {
          falsetrue=!falsetrue; 
          pin =7;
        } // pin 7
        if (x==260) {
          falsetrue=!falsetrue; 
          pin =8;
        } // pin 8
        if (x==280) {
          falsetrue=!falsetrue; 
          pin =9;
        } // pin 9
        if (x==300) {
          falsetrue=!falsetrue; 
          pin =10;
        } // pin 10
        if (x==320) {
          falsetrue=!falsetrue; 
          pin =11;
        } // pin 11
        if (x==340) {
          falsetrue=!falsetrue; 
          pin =12;
        } // pin 12
        if (x==360) {
          falsetrue=!falsetrue; 
          pin =13;
        } // pin 13
      } else

        if ( lastid==11 || lastid==13 && posy==40 || lastid==-11 || lastid==-13 && posy==40) { // seleccionar casilla salidadigital
          if (x==100) { 
            pin =0;
          } // pin 0
          if (x==120) { 
            pin =1;
          } // pin 1
          if (x==140) { 
            pin =2;
          } // pin 2
          if (x==160) { 
            pin =3;
          } // pin 3
          if (x==180) { 
            pin =4;
          } // pin 4
          if (x==200) { 
            pin =5;
          } // pin 5
          if (x==220) { 
            pin =6;
          } // pin 6
          if (x==240) { 
            pin =7;
          } // pin 7
          if (x==260) { 
            pin =8;
          } // pin 8
          if (x==280) { 
            pin =9;
          } // pin 9
          if (x==300) { 
            pin =10;
          } // pin 10
          if (x==320) { 
            pin =11;
          } // pin 11
          if (x==340) { 
            pin =12;
          } // pin 12
          if (x==360) { 
            pin =13;
          } // pin 13
        } else

          if ( lastid==12 && posy==40 || lastid==-12 && posy==40) { // seleccionar casilla salidadigital
            if (x==100) { 
              pin =0;
            } // pin 0
            if (x==120) { 
              pin =1;
            } // pin 1
            if (x==140) { 
              pin =2;
            } // pin 2
            if (x==160) { 
              pin =3;
            } // pin 3
            if (x==180) { 
              pin =4;
            } // pin 4
            if (x==200) { 
              pin =5;
            } // pin 5
          }     

      ///* // botones  Var ARGUMENTO 1
      if (posy== 100 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 100 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }


      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar ARDUINO
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);

        if (lastid == 11 || lastid == -11) renuevaobjeto.setString("instruccion", "entradadigital");
        if (lastid == 12 || lastid == -12) renuevaobjeto.setString("instruccion", "entradaanalogica");
        if (lastid == 13 || lastid == -13) renuevaobjeto.setString("instruccion", "servo");


        if (lastid == 11) linea = "arduino.pinMode("+pin+", Arduino.INPUT_PULLUP);\n"+px+" = arduino.digitalRead("+pin+");\n"; // entradigital
        if (lastid == 12) linea = px+" = arduino.analogRead("+pin+");\n"; //entradaanalogica
        if (lastid == 13) linea = "arduino.pinMode("+pin+", Arduino.SERVO);\narduino.servoWrite("+pin+", "+px+");";
        
        if (lastid == -11) linea = px+" = int(loadStrings(\"http://"+configuration.getJSONObject(3).getString("ip")+"/?EDPIN="+pin+"\")[0]);"; // entradigital
        if (lastid == -12) linea = px+" = int(loadStrings(\"http://"+configuration.getJSONObject(3).getString("ip")+"/?EAPIN="+pin+"\")[0]);"; //entradaanalogica
        if (lastid == -13) linea = "loadStrings(\"http://"+configuration.getJSONObject(3).getString("ip")+"/?SMPIN="+pin+"&ANGLE="+px+"\");"; 

        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("pin", int(pin));
        renuevaobjeto.setString("variable", px);

        renuevaobjeto.setString("pde", linea);
        //println(renuevaobjeto);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin Arduino



    ///////////////////////////////////////////////////////////////////////////




    if (lastid == 97 || lastid == 61 || lastid == 62 || lastid == 63 || lastid == 64 || lastid == 65) {  // ALEATORIO

      if (posy== 80 )  argumentos= 1000010; // casilla y


      ///* // botones  Var ARGUMENTO 1
      if (posy== 40 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar ALEATORIO
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid == 97) renuevaobjeto.setString("instruccion", "aleatorio");
        if (lastid == 61) renuevaobjeto.setString("instruccion", "asignar");
        if (lastid == 62) renuevaobjeto.setString("instruccion", "sumar");
        if (lastid == 63) renuevaobjeto.setString("instruccion", "restar");
        if (lastid == 64) renuevaobjeto.setString("instruccion", "multiplicar");
        if (lastid == 65) renuevaobjeto.setString("instruccion", "dividir");

        if (lastid == 97) linea = ""+px+" = random("+py+");";
        if (lastid == 61) linea = ""+px+" = "+py+";";
        if (lastid == 62) linea = ""+px+" = "+px+" + "+py+";";
        if (lastid == 63) linea = ""+px+" = "+px+" - "+py+";";
        if (lastid == 64) linea = ""+px+" = "+px+" * "+py+";";
        if (lastid == 65) linea = ""+px+" = "+px+" / "+py+";";

        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("variable", px);
        if (lastid == 97) renuevaobjeto.setInt("vmaximo", int(py));
        if (lastid == 61 || lastid == 62 || lastid == 63 || lastid == 64 || lastid == 65) renuevaobjeto.setString("valor", py);

        renuevaobjeto.setString("pde", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin aleatorio

    ///////////////////////////////////////////////////////////////////////////

    if (lastid == 109 || lastid == 118) {  // IMAGEN || VIDEO

      if (posy== 40)  eligearchivo(); // casilla nombre
      if (arguvar1==false && posy== 80 )  argumentos= 1000001; // casilla x
      if (arguvar2==false && posy== 120 )  argumentos= 1000010; // casilla y


      ///* // botones  Var ARGUMENTO 1
      if (posy== 80 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 80 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }


      ///* // botones  Var ARGUMENTO 2
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        py = "";
      }

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (lastid == 109)linea = "PImage ima = loadImage("+'\"'+linea+temp+'\"'+"); image( ima, "+px+", "+py+" );";
        if (lastid == 118)linea = "\nif(inivideo==false){\nmovie = new Movie(this, \""+temp+"\" ); \nmovie.jump(0.0); \nmovie.play(); \ninivideo=true; \n} \nimage(movie, "+px+", "+py+");";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid == 109) renuevaobjeto.setString("instruccion", "imagen");
        if (lastid == 118) renuevaobjeto.setString("instruccion", "video");
        renuevaobjeto.setInt("id", lastid);
        if (arguvar1==false)renuevaobjeto.setInt("px", int(px));
        if (arguvar1==true)renuevaobjeto.setString("pxv", px);
        if (arguvar2==false)renuevaobjeto.setInt("py", int(py));
        if (arguvar2==true)renuevaobjeto.setString("pyv", py);
        renuevaobjeto.setString("nombre", temp);

        renuevaobjeto.setString("pde", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin imagen || video

    ///////////////////////////////////////////////////////////////////////////

    if (lastid == 116) {  // TEXTO
      if (posy== 20) { // casilla variable texot
        lastargu=3;
        variables = new PWindow4();
        if (varclicked==true) varclicked=false;
      }
      if (posy== 40)  arguvar0=true; // casilla nombre
      if (arguvar1==false && posy== 80 ) { 
        arguvar0=false; 
        argumentos= 1000001;
      } // casilla x
      if (arguvar2==false && posy== 120 ) { 
        arguvar0=false; 
        argumentos= 1000010;
      } // casilla y


      ///* // botones  Var ARGUMENTO 1
      if (posy== 80 && mouseX>293 && mouseX<325) {
        arguvar1=true;
        lastargu=1;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar1=false;
      } 

      ///* // botón  # ARGUMENTO 1
      if (posy== 80 && mouseX>272 && mouseX<287) {
        arguvar1=false;
        lastargu=1;
        px = "";
      }


      ///* // botones  Var ARGUMENTO 2
      if (posy== 120 && mouseX>293 && mouseX<325) {
        arguvar2=true;
        lastargu=2;
        variables = new PWindow4();
        if (varclicked==true) { 
          varclicked=false;
        } else arguvar2=false;
      } 

      ///* // botón  # ARGUMENTO 2
      if (posy== 120 && mouseX>272 && mouseX<287) {
        arguvar2=false;
        lastargu=2;
        py = "";
      }

      // boton cancelar
      if (posy== 220 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 220 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = "text( \""+temp+"\", "+px+", "+py+" );";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "texto");
        renuevaobjeto.setInt("id", lastid);
        if (arguvar1==false)renuevaobjeto.setInt("px", int(px));
        if (arguvar1==true)renuevaobjeto.setString("pxv", px);
        if (arguvar2==false)renuevaobjeto.setInt("py", int(py));
        if (arguvar2==true)renuevaobjeto.setString("pyv", py);
        renuevaobjeto.setString("texto", temp);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    } // fin TEXTO    

    if (lastid==100) { // sound
      if ( posy== 80 && mouseX>300 && mouseX<390) {
        eligearchivo();
      }
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";

        linea = "AudioPlayer cancion = canal.loadFile( \""+temp+"\", 2048);\ncancion.rewind(); \ncancion.play();";

        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "sonido");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("nombre", temp);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    } // fin sound

    // cerrar splash al abrir Meta_Processing
    if (opening==true && s>20) {
      mainwindow=true;
      codewin=true;
      opening=false;
      surface.setVisible(false);
      exit();
    }

    if (seleidio==true) {

      seleidio=false;
      surface.setVisible(false);
      exit();
    }


    // botones cambiar puerto en configuración
    if (config==true) {
      
      // + velocidad
      if (posy==80 && mouseX>320 && mouseX<340) if (velocidad<60) velocidad++;
      
      // - velocidad
      if (posy==80 && mouseX>360 && mouseX<380) if (velocidad>1) velocidad--;
      
      if (posy==200 && mouseX>50 && mouseX<70) if (port > 0) { 
        port--; 
        configuration.getJSONObject(2).setInt("puerto", port);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
      }
      if (posy==200 && mouseX>90 && mouseX<110) if (port < Arduino.list().length-1) { 
        port++; 
        configuration.getJSONObject(2).setInt("puerto", port);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
      }
    }
  } // fin void mousePressed

  void keyPressed() {

    if (lastid == 114||lastid == 101 || lastid == 108 || lastid == 51|| lastid == 109 || lastid == 118) { // positam
      if (argumentos == 1000001)px=typeint(px);
      if (argumentos == 1000010)py=typeint(py);
      if (argumentos == 1000100)ancho=typeint(ancho);
      if (argumentos == 1001000)alto=typeint(alto);
    }
    if (lastid == 105) { // positam
      if (argumentos == 1000001)valor1=typeint(valor1);
      if (argumentos == 1000010)valor2=typeint(valor2);
      if (argumentos == 1000100)valor2="'"+key+"'";
    }
    if (lastid == 116) { // texto
      if (argumentos == 1000001)px=typeint(px);
      if (argumentos == 1000010)py=typeint(py);
      if (arguvar0==true) temp = typetext(temp);
    }
    if (lastid == 51) {
      if (argumentos == 1010000)pxt3=typeint(pxt3);
      if (argumentos == 1100000)pyt3=typeint(pyt3);
    }
    if (lastid == 0) instru = typetext(instru); // comentario
    if (lastid == 66) instru = typetext(instru); // formula
    if (lastid == 40) instru = typetext(instru); // código nativo

    if (lastid == 99) {
      if (argumentos == 1000001)temp = typetext(temp);
      if (argumentos == 1000010)px=typeint(px);
    }
    if (config==true) { 
      temp = typetext(temp); // ip address
      configuration.getJSONObject(3).setString("ip", temp);
      saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
    }
    if (agregarvar ==true) temp = typetext(temp); // variable
    if (selectvarini == true) temp = typefloat(temp); // valor para inializar la variable seleccionada
    if (proyecto == true) {
      proyectonombre = typetext(proyectonombre); 
      proyectonombre = proyectonombre.toLowerCase();
    } // nombre proyecto se usa la funcion toLowerCase para que no se escriba el nombre con letras mayusculas para evitar errores de ejecucion con libreria firmata arduino
    if (lastid == 117) temp=typeint(temp); // tamtexto
    if (lastid == 13 || lastid ==-13) { // servo
      px=typeint(px);
    }
    if (lastid == 97 || lastid == 61 || lastid == 62 || lastid == 63 || lastid == 64 || lastid == 65) py=typefloat(py); // tamtexto

    if (para==true) {
      // casillas texto
      if (argumentos== 1000001)valor1=typeint(valor1);
      // casilla argumento 1
      if (argumentos== 1000010)limitepara=typeint(limitepara);
      // casilla argumento 2
      if (argumentos== 1000100)valor2=typeint(valor2);
      // casilla argumento 2
    }
  }

  //--------------
  //    IDIOMA
  //--------------

  void idioma() {

    background(0);
    posy= mouseY-mouseY % 20;
    y= ((posy-40)/20)+1;
    fill(120);
    if (posy>20 && posy< 460)rect(0, posy, width, 20);

    text("Meta_Processing", 10, 17);
    fill(255);
    textLeading(20);
    text("Español", 20, 57);
    text("Française", 20, 77);

    /*
     //pushStyle();
     //textFont(createFont("Arial Unicode MS",18));
     //text("ᓀᐦᐃᔭᐃ", 20, 97); // cree
     //popStyle();
     */


    pushStyle();
    textFont(createFont("Arial Unicode MS", 18));
    text("हिन्दी", 20, 97); // hindi
    popStyle();

    pushStyle();
    textFont(createFont("Arial Unicode MS", 18));
    text("日本人", 20, 117); // japones
    popStyle();
    text("Italiano", 20, 137); 
    pushStyle();
    textFont(createFont("Arial Unicode MS", 18));
    text("中文", 20, 157); // chino
    popStyle();

    text("Português", 20, 177); 
    text("English", 20, 197);
    text(idiomagui.getString("Nuevo")+" "+idiomagui.getString("Idioma"), 20, 217);
  }

  //--------------
  //    SPLASH
  //--------------

  void splash() {
    surface.setTitle("META_PROCESSING Version Alpha 1.2");
    if (s<99)s = millis() / 100;
    fill(0, 0, 255);
    if (s>89)fill(0, 255, 0);
    rect(200, 390, s, 5); // barra de carga

    image(logo, logox, 60);
    image(logo, logo2x, 60);
    textAlign(CENTER, CENTER);
    fill(255);
    text("META_PROCESSING Version Alpha 1.2", 255, 340);
    fill(120);
    text("Developed using Processing 3.4", 255, 360);
    text("(ɔ) 2020  Jose David Cuartas, GPL v.3\nHiteclab, http://hiteclab.libertadores.edu.co/\nFundación Universitaria Los Libertadores, Colombia", 255, 440);
    text("Contact us: hiteclab@libertadores.edu.co", 255, 520);
    if (logox>-1000)logox--; 
    else logox=1000;
    if (logo2x>-1000)logo2x--; 
    else logo2x=1000;
  }

  //--------------
  // INSTRUCCION
  //--------------

  void instruccion() {
    background(0);

    posy= mouseY-mouseY % 20;
    y= ((posy-40)/20)+1;
    fill(120);
    if (posy>0 && posy!=40 && posy!=180 && posy!=320 && posy!=400 && posy!=460 && posy!=620 && mouseX<width/3)rect(0, posy, width/3, 20);
    if (posy>0 && posy!=100 && posy!=200 && posy< 240 && posy!=620 && mouseX>width/3)rect(width/3, posy, width/3, 20);

    // Documentar
    fill(120);
    text(idiomagui.getString("Documentar"), 10, 17);
    fill(255);
    text(""+idiomaactual.get(str(0)), 40, 37); // 0 es el id de comentario

    fill(120);
    text(idiomagui.getString("Gráficos"), 10, 57);
    textLeading(20);
    fill(255);
    text(""+idiomaactual.get(str(108))+"\n"+idiomaactual.get(str(51))+"\n"+idiomaactual.get(str(114))+"\n"+idiomaactual.get(str(101))+"\n"+idiomaactual.get(str(116))+"\n"+idiomaactual.get(str(109)), 40, 77);
    fill(120);
    text(idiomagui.getString("Propiedades"), 10, 197);
    fill(255);
    text(""+idiomaactual.get(str(98))+"\n"+idiomaactual.get(str(115))+"\n"+idiomaactual.get(str(102))+"\n"+idiomaactual.get(str(-102))+"\n"+idiomaactual.get(str(-115))+"\n"+idiomaactual.get(str(117)), 40, 217);
    fill(120);
    text(idiomagui.getString("Multimedia"), 10, 337);
    fill(255);
    text(""+idiomaactual.get(str(110))+"\n"+idiomaactual.get(str(100))+"\n"+idiomaactual.get(str(118)), 40, 357);
    fill(120);
    text(idiomagui.getString("Estructuras"), 10, 417);

    fill(255);
    text(""+idiomaactual.get(str(105)), 40, 437);
    text(""+idiomaactual.get(str(111)), 40, 457);

    fill(120);
    text(idiomagui.getString("Matemáticas"), 10, 477);

    fill(255);
    text(""+idiomaactual.get(str(61)), 40, 497); // asignar
    text(""+idiomaactual.get(str(62)), 40, 517); // sumar
    text(""+idiomaactual.get(str(63)), 40, 537); // restar
    text(""+idiomaactual.get(str(64)), 40, 557); // multiplicar
    text(""+idiomaactual.get(str(65)), 40, 577); // dividir
    text(""+idiomaactual.get(str(97)), 40, 597); // aleatorio
    text(idiomagui.getString("fórmula"), 40, 617); // fórmula
    fill(120);
    text("Arduino", (width/3)+10, 17);

    fill(255);
    text(""+idiomaactual.get(str(10)), (width/3)+40, 37);
    text(""+idiomaactual.get(str(11)), (width/3)+40, 57);
    text(""+idiomaactual.get(str(12)), (width/3)+40, 77);
    text(""+idiomaactual.get(str(13)), (width/3)+40, 97);

    fill(120);
    text("IoTControllerAP", (width/3)+10, 117);
    fill(255);
    text(""+idiomaactual.get(str(10)), (width/3)+40, 137);
    text(""+idiomaactual.get(str(11)), (width/3)+40, 157);
    text(""+idiomaactual.get(str(12)), (width/3)+40, 177);
    text(""+idiomaactual.get(str(13)), (width/3)+40, 197);
    
    fill(120);
    text(idiomagui.getString("Avanzadas"), (width/3)+10, 217);
    fill(255);
    text(idiomagui.getString("código")+" "+idiomagui.getString("nativo"), (width/3)+40, 237);
    //text(""+idiomaactual.get(str(41)), (width/3)+40, 157);

    //text(idiomagui.getString("bloque")+" "+idiomagui.getString("código"), (width/3)+40, 157);
  }

  //--------------
  //   PARA
  //--------------

  void para() {
    background(200);



    if (para==false) {

      condicional= ""+objeto.get("condicion");
      if (objeto.isNull("valorini") == false) valor1= ""+str(objeto.getInt("valorini"));
      if (objeto.isNull("incremento") == false) valor2= ""+objeto.get("incremento");
      if (objeto.isNull("valorfinal") == false) limitepara = ""+str(objeto.getInt("valorfinal")); 
      else limitepara="";
      para=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    fill(0);
    text(idiomagui.getString("Valor")+" "+idiomagui.getString("inicial")+":", 30, 55);
    fill(128);
    //text(idiomagui.getString("ciclo"), 280, 55);
    text("("+idiomagui.getString("Variable")+" "+idiomagui.getString("ciclo")+")", 280, 55);
    fill(0);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(valor1+"|", 170, 57); // muestra valor inicial
    }
    fill(255);
    text(valor1, 170, 57); // muestra valor inicial

    fill(0);
    text(idiomagui.getString("mientras")+":", 30, 95);
    fill(80);
    text(idiomagui.getString("ciclo"), 120, 95);

    fill(255);
    rect(169, 80, 15, 20); // rect >
    fill(0);
    text("<", 170, 95);
    if (condicional.equals("<") || posy== 80 && mouseX>170 && mouseX<185) {
      fill(80);
      rect(169, 80, 15, 20); // rect >
      fill(0);
      text("<", 170, 95);
    }

    fill(255);
    rect(189, 80, 15, 20); // rect <
    fill(0);
    text(">", 190, 95);
    if (condicional.equals(">") || posy== 80 && mouseX>190 && mouseX<205) {
      fill(80);
      rect(189, 80, 15, 20); // rect <
      fill(0);
      text(">", 190, 95);
    }

    fill(255);
    rect(209, 80, 25, 20); // rect =
    fill(0);
    text("<=", 210, 95);
    if (condicional.equals("<=") || posy== 80 && mouseX>210 && mouseX<225) {
      fill(80);
      rect(209, 80, 25, 20); // rect =
      fill(0);
      text("<=", 210, 95);
    }

    fill(255);
    rect(239, 80, 25, 20); // rect =
    fill(0);
    text(">=", 241, 95);
    if (condicional.equals(">=") || posy== 80 && mouseX>230 && mouseX<255) {
      fill(80);
      rect(239, 80, 25, 20); // rect =
      fill(0);
      text(">=", 241, 95);
    }

    fill(0);
    rect(280, 80, 140, 20); // casilla condición
    if (posy== 80 && mouseX>280 && mouseX<420 ||argumentos== 1000010) { 
      fill(100);
      rect(280, 80, 140, 20); // casilla condición
      fill(0);
      text(limitepara+"|", 282, 95);
    }
    fill(255);
    text(limitepara, 282, 95);



    fill(0);
    text(idiomagui.getString("Incremento")+":", 30, 135);
    fill(128);
    text("("+idiomagui.getString("Variable")+" "+idiomagui.getString("ciclo")+")", 280, 135);
    fill(0);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(valor2+"|", 170, 137); // muestra el incremento
    }
    fill(255);
    text(valor2, 170, 137); // muestra el incremento





    /*
    /// TEXTO DE BOTONES # y VAR
     fill(0);
     text("#   Vr", 272, 55);
     text("#   Vr", 272, 135);
     */


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin PARA


  //--------------
  //   CONDICIÓN
  //--------------

  void condicion() {
    background(200);

    if (varclicked==true && lastargu==1) {
      valor1 = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }


    if (varclicked==true && lastargu==2) {
      valor2 = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }      

    if (condicion==false) {

      condicional= ""+objeto.get("condicion");

      if (objeto.isNull("valor1") == false) valor1= ""+objeto.get("valor1");
      if (objeto.isNull("valor1v") == false) { 
        valor1= ""+objeto.get("valor1v"); 
        arguvar1=true;
      }
      if (objeto.isNull("valor2") == false) valor2= ""+objeto.get("valor2");
      if (objeto.isNull("valor2v") == false) { 
        valor2= ""+objeto.get("valor2v"); 
        arguvar2=true;
      }
      condicion=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);

    fill(255);
    if (arguvar1 == true || posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var

    fill(255);
    if (arguvar1 == false || posy== 40 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 40, 15, 20); // cuadro #




    // botones  # y Var ARGUMENTO 3
    fill(255);
    if (arguvar2 == true || posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if ((arguvar2 == false && mousebif == false && keyif == false) || posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #


    // boton Caracter
    fill(255);
    if (keyif ==true || posy== 120 && mouseX>331 && mouseX<346)fill(80);
    rect(331, 120, 15, 20); // cuadro Caracter
    fill(0);
    text("C", 332, 137);

    // boton mouseButton
    fill(255);
    if (mousebif == true || posy== 120 && mouseX>352 && mouseX<368)fill(80);
    rect(352, 120, 16, 20); // cuadro mouseButton
    rect(352, 120, 16, 8);
    rect(358, 120, 4, 8);



    fill(0);
    text(idiomagui.getString("Valor")+" 1: ", 30, 55);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(valor1+"|", 170, 57);
    }
    fill(255);
    text(valor1, 170, 57); // muestra valor x

    fill(255);
    rect(169, 80, 15, 20); // rect >
    fill(0);
    text("=", 170, 95);
    if (condicional.equals("=") || posy== 80 && mouseX>170 && mouseX<185) {
      fill(80);
      rect(169, 80, 15, 20); // rect >
      fill(0);
      text("=", 170, 95);
    }

    fill(255);
    rect(189, 80, 15, 20); // rect <
    fill(0);
    text("<", 190, 95);
    if (condicional.equals("<") || posy== 80 && mouseX>190 && mouseX<205) {
      fill(80);
      rect(189, 80, 15, 20); // rect <
      fill(0);
      text("<", 190, 95);
    }

    fill(255);
    rect(209, 80, 15, 20); // rect =
    fill(0);
    text(">", 210, 95);
    if (condicional.equals(">") || posy== 80 && mouseX>210 && mouseX<225) {
      fill(80);
      rect(209, 80, 15, 20); // rect =
      fill(0);
      text(">", 210, 95);
    }

    fill(255);
    rect(229, 80, 25, 20); // rect =
    fill(0);
    text("!=", 231, 95);
    if (condicional.equals("!=") || posy== 80 && mouseX>230 && mouseX<255) {
      fill(80);
      rect(229, 80, 25, 20); // rect =
      fill(0);
      text("!=", 231, 95);
    }


    fill(0);
    text(idiomagui.getString("Valor")+" 2:", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(valor2+"|", 170, 137);
    }
    fill(255);
    text(valor2, 170, 137);






    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 55);
    text("#   Vr", 272, 135);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin CONDICIÓN


  //----------
  //  TAMTEXTO
  //-----------

  void tamtexto() {
    if (texto==false) {

      if (objeto.isNull("tamtexto") == false)temp= ""+objeto.get("tamtexto"); 
      else temp = "";
      texto=true;
    }

    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = "textSize( "+temp+" );";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "tamtexto");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("tamtexto", temp);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }
    background(200);

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);
    text(idiomagui.getString("Tamaño"), 30, 55);
    rect(168, 40, 100, 20); // area de texto tamaño
    fill(255);
    text(temp+"|", 170, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }

  //--------------
  //   ALEATORIO
  //--------------

  void aleatorio() {
    background(200);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }

    if (aleatorio==false) {
      if (objeto.isNull("variable") == false) px= ""+objeto.get("variable"); 
      else px="";
      arguvar1=true;
      if (lastid== 97 && objeto.isNull("vmaximo") == false) py= ""+objeto.get("vmaximo"); 
      else
        if (lastid== 61 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); 
        else
          if (lastid== 62 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); 
          else
            if (lastid== 63 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); 
            else
              if (lastid== 64 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); 
              else
                if (lastid== 65 && objeto.isNull("valor") == false) py= ""+objeto.get("valor"); 
                else py="";
      aleatorio=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var

    //*/
    fill(0);
    text(idiomagui.getString("Variable")+": ", 30, 55);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);
    if (lastid == 97)text(idiomagui.getString("Valor")+" "+idiomagui.getString("Máximo")+":", 30, 95);
    if (lastid == 61)text(idiomaactual.getString(str(61))+" "+idiomagui.getString("Valor")+":", 30, 95);
    if (lastid == 62)text(idiomaactual.getString(str(62))+" "+idiomagui.getString("Valor")+":", 30, 95);
    if (lastid == 63)text(idiomaactual.getString(str(63))+" "+idiomagui.getString("Valor")+":", 30, 95);
    if (lastid == 64)text(idiomaactual.getString(str(64))+" "+idiomagui.getString("Valor")+":", 30, 95);
    if (lastid == 65)text(idiomaactual.getString(str(65))+" "+idiomagui.getString("Valor")+":", 30, 95);
    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);





    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("Vr", 294, 55);



    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin ALEATORIO

  //--------------
  //   POSITAM
  //--------------

  void positam() {
    background(200);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }
    if (varclicked==true && lastargu==3) {
      //println(nvarselec);
      ancho = varenterasnom.get(nvarselec); 
      arguvar3=true; 
      varclicked=false;
    }      
    if (varclicked==true && lastargu==4) {
      alto = varenterasnom.get(nvarselec); 
      arguvar4=true; 
      varclicked=false;
    }      

    if (positam==false) {
      if (objeto.isNull("px") == false) px= ""+objeto.get("px");
      if (objeto.isNull("pxv") == false) { 
        px= ""+objeto.get("pxv"); 
        arguvar1=true;
      }
      if (objeto.isNull("py") == false) py= ""+objeto.get("py");
      if (objeto.isNull("pyv") == false) { 
        py= ""+objeto.get("pyv"); 
        arguvar2=true;
      }
      if (objeto.isNull("tx") == false) ancho= ""+objeto.get("tx");
      if (objeto.isNull("txv") == false) { 
        ancho= ""+objeto.get("txv");
        arguvar3=true;
      }
      if (objeto.isNull("ty") == false) alto= ""+objeto.get("ty");
      if (objeto.isNull("tyv") == false) { 
        alto= ""+objeto.get("tyv");
        arguvar4=true;
      }
      positam=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var
    fill(255);
    if (posy== 40 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 40, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 3
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 4
    fill(255);
    if (posy== 160 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 160, 32, 20); // cuadro var
    fill(255);
    if (posy== 160 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 160, 15, 20); // cuadro #

    fill(0);
    text(idiomagui.getString("Posición")+" X: ", 30, 55);
    rect(168, 40, 100, 20);  // area de texto valor
    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);
    text(idiomagui.getString("Posición")+" Y:", 30, 95);
    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);

    fill(0);
    text(idiomagui.getString("Ancho")+":", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(ancho+"|", 170, 137);
    }
    fill(255);
    text(ancho, 170, 137);


    fill(0);
    text(idiomagui.getString("Alto")+":", 30, 175);
    rect(168, 160, 100, 20);  // area de texto
    if (posy== 160||argumentos== 1001000) {
      fill(80);
      rect(168, 160, 100, 20);
      fill(0);
      text(alto+"|", 170, 177);
    }
    fill(255);
    text(alto, 170, 177);



    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 55);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);
    text("#   Vr", 272, 175);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin POSITAM


  //-------------------
  //   IMAGEN || VIDEO
  //-------------------

  void imagen() {
    background(200);
    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }


    if (imagen==false) {
      if (objeto.isNull("px") == false) px= ""+objeto.get("px");
      if (objeto.isNull("pxv") == false) { 
        px= ""+objeto.get("pxv"); 
        arguvar1=true;
      }
      if (objeto.isNull("py") == false) py= ""+objeto.get("py");
      if (objeto.isNull("pyv") == false) { 
        py= ""+objeto.get("pyv"); 
        arguvar2=true;
      }
      if (objeto.isNull("nombre") == false) temp= ""+objeto.get("nombre");
      imagen=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);



    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);


    fill(0);
    if (lastid==109)text(idiomagui.getString("Imagen")+":", 30, 55);
    if (lastid==118)text(idiomaactual.get("118")+":", 30, 55);
    rect(168, 40, width, 20);  // area de texto
    if (posy== 40||argumentos== 1000100) {
      fill(80);
      rect(168, 40, width, 20);
      fill(0);
      text(temp, 170, 57);
    }
    fill(255);
    text(temp, 170, 57);
    fill(0);

    text(idiomagui.getString("Posición")+" X: ", 30, 95);
    rect(168, 80, 100, 20);  // area de texto valor
    if (posy== 80||argumentos== 1000001) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(px+"|", 170, 97);
    }
    fill(255);
    text(px, 170, 97); // muestra valor x
    fill(0);

    text(idiomagui.getString("Posición")+" Y:", 30, 135);
    rect(168, 120, 100, 20); // area de texto
    if (posy== 120||argumentos== 1000010) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(py+"|", 170, 137);
    }
    fill(255);
    text(py, 170, 137);
    fill(0);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin IMAGEN

  //--------------
  //   Capsula
  //--------------

  void capsula() {
    background(200);
    //println(posy);

    /*
    if (varclicked==true && lastargu==1) {
     px = varenterasnom.get(nvarselec); 
     arguvar1=true; 
     varclicked=false;
     }
     
     if (varclicked==true && lastargu==2) {
     py = varenterasnom.get(nvarselec); 
     arguvar2=true; 
     varclicked=false;
     }
     
     // si se lecciona variable texto
     if (varclicked==true && lastargu==3) {
     temp = temp+"\"+"+varenterasnom.get(nvarselec)+"+\""; 
     arguvar3=true; 
     varclicked=false;
     }
     */

    if (texto==false) {

      if (objeto.isNull("capsula") == false) temp= ""+objeto.get("capsula");
      if (objeto.isNull("final") == false) px= ""+objeto.get("final");
      texto=true;
    }

    fill(80);

    text(""+idiomagui.getString("bloque")+" "+idiomagui.getString("código"), 10, 20);


    fill(0);
    text(idiomagui.getString("Nombre")+":", 30, 55);
    rect(168, 40, width, 20);  // area de texto
    if (posy== 40||arguvar0==true) {
      fill(80);
      rect(168, 40, width, 20);
      fill(0);
      text(temp+"|", 170, 57);
    }
    fill(255);
    text(temp, 170, 57);
    fill(0);

    text(idiomagui.getString("hasta")+" "+idiomaactual.get("108")+" :", 30, 95);
    rect(168, 80, 140, 20);  // area de texto valor
    if (posy== 80||argumentos== 1000001) {
      fill(80);
      rect(168, 80, 140, 20);
      fill(0);
      text(px+"|", 170, 97);
    }
    fill(255);
    text(px, 170, 97); // muestra valor x


    fill(0);    
    text(idiomagui.getString("Mostrar"), 30, 135);
    fill(255);
    noStroke();
    ellipse(178, 130, 20, 20);  // casilla mostrar





    fill(0);
    text(idiomagui.getString("Ocultar"), 30, 175);
    fill(255);
    noStroke();
    ellipse(178, 170, 20, 20);  // casilla mostrar

    if (muestrabloque) {
      fill(0);
      ellipse(178, 130, 5, 5);
    } else {
      fill(0);
      ellipse(178, 170, 5, 5);
    }


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin capsula

  //--------------
  //   TEXTO
  //--------------

  void texto() {
    background(200);
    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }

    // si se lecciona variable texto
    if (varclicked==true && lastargu==3) {
      temp = temp+"\"+"+varenterasnom.get(nvarselec)+"+\""; 
      arguvar3=true; 
      varclicked=false;
    }


    if (texto==false) {
      if (objeto.isNull("px") == false) px= ""+objeto.get("px");
      if (objeto.isNull("pxv") == false) { 
        px= ""+objeto.get("pxv"); 
        arguvar1=true;
      }
      if (objeto.isNull("py") == false) py= ""+objeto.get("py");
      if (objeto.isNull("pyv") == false) { 
        py= ""+objeto.get("pyv"); 
        arguvar2=true;
      }
      if (objeto.isNull("texto") == false) temp= ""+objeto.get("texto");
      texto=true;
    }




    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);


    // var texto
    fill(255);
    if (posy== 20 && mouseX>168 && mouseX<200)fill(80);
    rect(168, 20, 32, 20); // cuadro var
    fill(0);
    text("Vr", 170, 35);

    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);


    fill(0);
    text(idiomagui.getString("Texto")+":", 30, 55);
    rect(168, 40, width, 20);  // area de texto
    if (posy== 40||arguvar0==true) {
      fill(80);
      rect(168, 40, width, 20);
      fill(0);
      text(temp+"|", 170, 57);
    }
    fill(255);
    text(temp, 170, 57);
    fill(0);

    text(idiomagui.getString("Posición")+" X: ", 30, 95);
    rect(168, 80, 100, 20);  // area de texto valor
    if (posy== 80||argumentos== 1000001) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(px+"|", 170, 97);
    }
    fill(255);
    text(px, 170, 97); // muestra valor x
    fill(0);

    text(idiomagui.getString("Posición")+" Y:", 30, 135);
    rect(168, 120, 100, 20); // area de texto
    if (posy== 120||argumentos== 1000010) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(py+"|", 170, 137);
    }
    fill(255);
    text(py, 170, 137);
    fill(0);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin TEXTO

  //----------------
  //  salidadigital
  //----------------

  void salidadigital() {

    if (mousePressed== true) {
      // boton cancelar
      if (posy== 100 && mouseX>41 && mouseX<131) {
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 100 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        
        if (falsetrue==false){if(lastid==10)linea = "arduino.digitalWrite( "+pin+", Arduino.LOW );"; if(lastid==-10) linea = "loadStrings(\"http://"+configuration.getJSONObject(3).getString("ip")+"/?SDPIN="+pin+"&STATE=0\");"; }
        else {if(lastid==10)linea = "arduino.digitalWrite( "+pin+", Arduino.HIGH );"; if(lastid==-10) linea = "loadStrings(\"http://"+configuration.getJSONObject(3).getString("ip")+"/?SDPIN="+pin+"&STATE=1\");"; }
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "salidadigital");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("pin", int(pin));
        renuevaobjeto.setInt("valor", int(falsetrue));
        renuevaobjeto.setString("pde", linea);
        //println(renuevaobjeto);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }

    x = mouseX-mouseX % 20;

    background(200);


    if (posy==40) {
      fill(128);
      if (x==100)rect(100, 40, 20, 20);
      if (x==120)rect(120, 40, 20, 20); 
      if (x==140)rect(140, 40, 20, 20);
      if (x==160)rect(160, 40, 20, 20);
      if (x==180)rect(180, 40, 20, 20);
      if (x==200)rect(200, 40, 20, 20); 
      if (x==220)rect(220, 40, 20, 20);
      if (x==240)rect(240, 40, 20, 20);
      if (x==260)rect(260, 40, 20, 20);
      if (x==280)rect(280, 40, 20, 20);
      if (x==300)rect(300, 40, 20, 20);
      if (x==320)rect(320, 40, 20, 20);
      if (x==340)rect(340, 40, 20, 20);
      if (x==360)rect(360, 40, 20, 20);
    }

    // dibuja las casillas vacias de los pines
    noFill();
    stroke(255);
    rect(100, 40, 20, 20);
    rect(120, 40, 20, 20); 
    rect(140, 40, 20, 20);
    rect(160, 40, 20, 20);
    rect(180, 40, 20, 20);
    rect(200, 40, 20, 20); 
    rect(220, 40, 20, 20);
    rect(240, 40, 20, 20);
    rect(260, 40, 20, 20);
    rect(280, 40, 20, 20);
    rect(300, 40, 20, 20);
    rect(320, 40, 20, 20);
    rect(340, 40, 20, 20);
    rect(360, 40, 20, 20);

    //Resalta la casilla del pin activado
    if (falsetrue == true)fill(255); 
    else fill(0);
    if (pin== 0 ) {
      rect(100, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 106, 58);
    }
    if (pin== 1 ) {
      rect(120, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 126, 58);
    }
    if (pin== 2 ) {
      rect(140, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 146, 58);
    }
    if (pin== 3 ) {
      rect(160, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 166, 58);
    }
    if (pin== 4 ) {
      rect(180, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 186, 58);
    }
    if (pin== 5 ) {
      rect(200, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 206, 58);
    }
    if (pin== 6 ) {
      rect(220, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 226, 58);
    }
    if (pin== 7 ) {
      rect(240, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 246, 58);
    }
    if (pin== 8 ) {
      rect(260, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 266, 58);
    }
    if (pin== 9 ) {
      rect(280, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 286, 58);
    }
    if (pin==10 ) {
      rect(300, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 306, 58);
    }
    if (pin==11 ) {
      rect(320, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 326, 58);
    }
    if (pin==12 ) {
      rect(340, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 346, 58);
    }
    if (pin==13 ) {
      rect(360, 40, 20, 20); 
      fill(128); 
      text(int(falsetrue), 366, 58);
    }


    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);

    fill(128);
    text("Pin:", 30, 58);

    fill(140);
    text("0", 104, 76);
    text("1", 124, 38); 
    text("2", 144, 76);
    text("3", 164, 38);
    text("4", 184, 78);
    text("5", 204, 38); 
    text("6", 224, 78);
    text("7", 244, 38);
    text("8", 264, 78);
    text("9", 284, 38);
    text("10", 301, 78);
    text("11", 321, 38);
    text("12", 341, 78);
    text("13", 361, 38);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 100, 90, 20);
    if (posy== 100 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 100, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 115);


    fill(20);
    rect(170, 100, 90, 20);
    if (posy== 100 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 100, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 115);
    stroke(0);
  }


  //----------------
  //  entradadigital
  //----------------

  void entradadigital() {
    x = mouseX-mouseX % 20;
    background(200);

    if (arduinoline==false) {
      if (objeto.isNull("variable") == false) px= ""+objeto.get("variable"); 
      else px="";
      if (objeto.isNull("pin") == false) pin= objeto.getInt("pin"); 
      else pin=0;
      arduinoline=true;
    }

    if (posy==40) {
      fill(128);
      if (x==100)rect(100, 40, 20, 20);
      if (x==120)rect(120, 40, 20, 20); 
      if (x==140)rect(140, 40, 20, 20);
      if (x==160)rect(160, 40, 20, 20);
      if (x==180)rect(180, 40, 20, 20);
      if (x==200)rect(200, 40, 20, 20); 
      if (x==220)rect(220, 40, 20, 20);
      if (x==240)rect(240, 40, 20, 20);
      if (x==260)rect(260, 40, 20, 20);
      if (x==280)rect(280, 40, 20, 20);
      if (x==300)rect(300, 40, 20, 20);
      if (x==320)rect(320, 40, 20, 20);
      if (x==340)rect(340, 40, 20, 20);
      if (x==360)rect(360, 40, 20, 20);
    }

    // dibuja las casillas vacias de los pines
    noFill();
    stroke(255);
    rect(100, 40, 20, 20);
    rect(120, 40, 20, 20); 
    rect(140, 40, 20, 20);
    rect(160, 40, 20, 20);
    rect(180, 40, 20, 20);
    rect(200, 40, 20, 20); 
    rect(220, 40, 20, 20);
    rect(240, 40, 20, 20);
    rect(260, 40, 20, 20);
    rect(280, 40, 20, 20);
    rect(300, 40, 20, 20);
    rect(320, 40, 20, 20);
    rect(340, 40, 20, 20);
    rect(360, 40, 20, 20);

    //Resalta la casilla del pin activado
    fill(255);
    if (pin== 0 )rect(100, 40, 20, 20);
    if (pin== 1 )rect(120, 40, 20, 20); 
    if (pin== 2 )rect(140, 40, 20, 20);
    if (pin== 3 )rect(160, 40, 20, 20);
    if (pin== 4 )rect(180, 40, 20, 20);
    if (pin== 5 )rect(200, 40, 20, 20);
    if (pin== 6 )rect(220, 40, 20, 20);
    if (pin== 7 )rect(240, 40, 20, 20);
    if (pin== 8 )rect(260, 40, 20, 20);
    if (pin== 9 )rect(280, 40, 20, 20);
    if (pin==10 )rect(300, 40, 20, 20);
    if (pin==11 )rect(320, 40, 20, 20);
    if (pin==12 )rect(340, 40, 20, 20);
    if (pin==13 )rect(360, 40, 20, 20);
    stroke(0);  

    fill(128);
    text("Pin:", 30, 58);

    fill(140);
    text("0", 104, 76);
    text("1", 124, 38); 
    text("2", 144, 76);
    text("3", 164, 38);
    text("4", 184, 78);
    text("5", 204, 38); 
    text("6", 224, 78);
    text("7", 244, 38);
    text("8", 264, 78);
    text("9", 284, 38);
    text("10", 301, 78);
    text("11", 321, 38);
    text("12", 341, 78);
    text("13", 361, 38);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (objeto.isNull("px") == false) px= ""+objeto.get("px");
    if (objeto.isNull("pxv") == false) { 
      px= ""+objeto.get("pxv"); 
      arguvar1=true;
    }

    // muestra el nombre de la variable
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);



    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 100 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 100, 32, 20); // cuadro var



    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("Vr", 297, 115);


    text(idiomagui.getString("Variable")+":", 30, 115);
    rect(168, 100, 100, 20);  // area de texto valor
    if (posy== 100||argumentos== 1000001) {
      fill(80);
      rect(168, 100, 100, 20);
      fill(0);
      text(px+"|", 170, 117);
    }
    fill(255);
    text(px, 170, 117); // muestra valor x
    fill(0);



    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin entradadital


  //----------------
  //  entraanalogica
  //----------------

  void entradaanalogica() {
    x = mouseX-mouseX % 20;
    background(200);

    if (arduinoline==false) {
      if (objeto.isNull("variable") == false) px= ""+objeto.get("variable"); 
      else px="";
      if (objeto.isNull("pin") == false) pin= objeto.getInt("pin"); 
      else pin=0;
      arduinoline=true;
    }

    if (posy==40) {
      fill(128);
      if (x==100)rect(100, 40, 20, 20); // pin 0
      if (x==120)rect(120, 40, 20, 20); // pin 1
      if (x==140)rect(140, 40, 20, 20); // pin 2
      if (x==160)rect(160, 40, 20, 20); // pin 3
      if (x==180)rect(180, 40, 20, 20); // pin 4
      if (x==200)rect(200, 40, 20, 20); // pin 5
    }

    // dibuja las casillas vacias de los pines
    noFill();
    stroke(255);
    rect(100, 40, 20, 20); // pin 0
    rect(120, 40, 20, 20); // pin 1
    rect(140, 40, 20, 20); // pin 2
    rect(160, 40, 20, 20); // pin 3
    rect(180, 40, 20, 20); // pin 4
    rect(200, 40, 20, 20); // pin 5


    //Resalta la casilla del pin activado
    fill(255);
    if (pin== 0 )rect(100, 40, 20, 20);
    if (pin== 1 )rect(120, 40, 20, 20); 
    if (pin== 2 )rect(140, 40, 20, 20);
    if (pin== 3 )rect(160, 40, 20, 20);
    if (pin== 4 )rect(180, 40, 20, 20);
    if (pin== 5 )rect(200, 40, 20, 20);

    stroke(0);  

    fill(128);
    text("Pin:", 30, 58);

    fill(140);
    text("0", 104, 76);
    text("1", 124, 38); 
    text("2", 144, 76);
    text("3", 164, 38);
    text("4", 184, 78);
    text("5", 204, 38); 

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (objeto.isNull("px") == false) px= ""+objeto.get("px");
    if (objeto.isNull("pxv") == false) { 
      px= ""+objeto.get("pxv"); 
      arguvar1=true;
    }


    // muestra el nombre de la variable
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);



    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 100 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 100, 32, 20); // cuadro var


    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("Vr", 297, 115);


    text(idiomagui.getString("Variable")+":", 30, 115);
    rect(168, 100, 100, 20);  // area de texto valor
    if (posy== 100||argumentos== 1000001) {
      fill(80);
      rect(168, 100, 100, 20);
      fill(0);
      text(px+"|", 170, 117);
    }
    fill(255);
    text(px, 170, 117); // muestra valor x
    fill(0);



    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin entraanalogica


  //----------------
  //  servo
  //----------------

  void servo() {
    x = mouseX-mouseX % 20;
    background(200);

    if (arduinoline==false) {
      if (objeto.isNull("variable") == false) px= ""+objeto.get("variable"); 
      else px="";
      if (objeto.isNull("pin") == false) pin= objeto.getInt("pin"); 
      else pin=0;
      arduinoline=true;
    }

    if (posy==40) {
      fill(128);
      if (x==100)rect(100, 40, 20, 20);
      if (x==120)rect(120, 40, 20, 20); 
      if (x==140)rect(140, 40, 20, 20);
      if (x==160)rect(160, 40, 20, 20);
      if (x==180)rect(180, 40, 20, 20);
      if (x==200)rect(200, 40, 20, 20); 
      if (x==220)rect(220, 40, 20, 20);
      if (x==240)rect(240, 40, 20, 20);
      if (x==260)rect(260, 40, 20, 20);
      if (x==280)rect(280, 40, 20, 20);
      if (x==300)rect(300, 40, 20, 20);
      if (x==320)rect(320, 40, 20, 20);
      if (x==340)rect(340, 40, 20, 20);
      if (x==360)rect(360, 40, 20, 20);
    }

    // dibuja las casillas vacias de los pines
    noFill();
    stroke(255);
    rect(100, 40, 20, 20);
    rect(120, 40, 20, 20); 
    rect(140, 40, 20, 20);
    rect(160, 40, 20, 20);
    rect(180, 40, 20, 20);
    rect(200, 40, 20, 20); 
    rect(220, 40, 20, 20);
    rect(240, 40, 20, 20);
    rect(260, 40, 20, 20);
    rect(280, 40, 20, 20);
    rect(300, 40, 20, 20);
    rect(320, 40, 20, 20);
    rect(340, 40, 20, 20);
    rect(360, 40, 20, 20);

    //Resalta la casilla del pin activado
    fill(255);
    if (pin== 0 )rect(100, 40, 20, 20);
    if (pin== 1 )rect(120, 40, 20, 20); 
    if (pin== 2 )rect(140, 40, 20, 20);
    if (pin== 3 )rect(160, 40, 20, 20);
    if (pin== 4 )rect(180, 40, 20, 20);
    if (pin== 5 )rect(200, 40, 20, 20);
    if (pin== 6 )rect(220, 40, 20, 20);
    if (pin== 7 )rect(240, 40, 20, 20);
    if (pin== 8 )rect(260, 40, 20, 20);
    if (pin== 9 )rect(280, 40, 20, 20);
    if (pin==10 )rect(300, 40, 20, 20);
    if (pin==11 )rect(320, 40, 20, 20);
    if (pin==12 )rect(340, 40, 20, 20);
    if (pin==13 )rect(360, 40, 20, 20);
    stroke(0);  

    fill(128);
    text("Pin:", 30, 58);

    fill(140);
    text("0", 104, 76);
    text("1", 124, 38); 
    text("2", 144, 76);
    text("3", 164, 38);
    text("4", 184, 78);
    text("5", 204, 38); 
    text("6", 224, 78);
    text("7", 244, 38);
    text("8", 264, 78);
    text("9", 284, 38);
    text("10", 301, 78);
    text("11", 321, 38);
    text("12", 341, 78);
    text("13", 361, 38);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (objeto.isNull("px") == false) px= ""+objeto.get("px");
    if (objeto.isNull("pxv") == false) { 
      px= ""+objeto.get("pxv"); 
      arguvar1=true;
    }

    // muestra el nombre de la variable
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);



    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 100 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 100, 32, 20); // cuadro var
    fill(255);
    if (posy== 100 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 100, 15, 20); // cuadro #


    /// TEXTO DE BOTONES # y VAR
    fill(0);
    //text("Vr", 297, 115);
    text("#   Vr", 275, 115);

    fill(128);
    text(idiomagui.getString("Angulo")+":", 30, 115);
    rect(168, 100, 100, 20);  // area de texto valor
    if (posy== 100||argumentos== 1000001) {
      fill(80);
      rect(168, 100, 100, 20);
      fill(0);
      text(px+"|", 170, 117);
    }
    fill(255);
    text(px, 170, 117); // muestra valor x
    fill(0);



    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin servo

  //--------
  //  NOTA
  //--------

  void nota() {


    if (tocanotas==false) {
      if (objeto.isNull("nota") == false) nota= objeto.getString("nota").charAt(0); 
      else nota='F';
      if (objeto.isNull("nota") == false) {
        octava= int(objeto.getString("nota").charAt(1))-48;
      } else octava=4;

      tocanotas=true;
    }

    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = "nota.playNote( \""+nota+str(octava)+"\" );";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "tocanota");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("nota", ""+nota+str(octava));
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }

    x = mouseX-mouseX % 20;

    background(200);
    if (mousePressed==true) {
      if (x==100) nota='C';
      if (x==120)nota='D';
      if (x==140)nota='E';
      if (x==160)nota='F';
      if (x==180)nota='G';
      if (x==200)nota='A';
      if (x==220)nota='B';

      if (x==320)octava = 0;
      if (x==340)octava = 1;
      if (x==360)octava = 2;
      if (x==380)octava = 3;
      if (x==400)octava = 4;
      if (x==420)octava = 5;
      if (x==440)octava = 6;
      if (x==460)octava = 7;
      if (x==480)octava = 8;
      if (x==500)octava = 9;
    }

    if (posy==40) {
      fill(80);
      if (x==100)rect(100, 40, 20, 20);
      if (x==120)rect(120, 40, 20, 20); 
      if (x==140)rect(140, 40, 20, 20);
      if (x==160)rect(160, 40, 20, 20);
      if (x==180)rect(180, 40, 20, 20);
      if (x==200)rect(200, 40, 20, 20); 
      if (x==220)rect(220, 40, 20, 20);

      if (x==320)rect(320, 40, 20, 20);
      if (x==340)rect(340, 40, 20, 20);
      if (x==360)rect(360, 40, 20, 20);
      if (x==380)rect(380, 40, 20, 20);
      if (x==400)rect(400, 40, 20, 20);
      if (x==420)rect(420, 40, 20, 20);
      if (x==440)rect(440, 40, 20, 20);
      if (x==460)rect(460, 40, 20, 20);
      if (x==480)rect(480, 40, 20, 20);
      if (x==500)rect(500, 40, 20, 20);
    }

    fill(0);
    if (nota=='C')rect(100, 40, 20, 20);
    if (nota=='D')rect(120, 40, 20, 20); 
    if (nota=='E')rect(140, 40, 20, 20);
    if (nota=='F')rect(160, 40, 20, 20);
    if (nota=='G')rect(180, 40, 20, 20);
    if (nota=='A')rect(200, 40, 20, 20); 
    if (nota=='B')rect(220, 40, 20, 20);

    if (octava==0)rect(320, 40, 20, 20);
    if (octava==1)rect(340, 40, 20, 20);
    if (octava==2)rect(360, 40, 20, 20);
    if (octava==3)rect(380, 40, 20, 20);
    if (octava==4)rect(400, 40, 20, 20);
    if (octava==5)rect(420, 40, 20, 20);
    if (octava==6)rect(440, 40, 20, 20);
    if (octava==7)rect(460, 40, 20, 20);
    if (octava==8)rect(480, 40, 20, 20);
    if (octava==9)rect(500, 40, 20, 20);

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);

    fill(128);
    text(idiomagui.getString("Nota")+":", 30, 58);
    text(idiomagui.getString("Octava")+":", 250, 58);

    fill(255);
    text("C", 104, 58);
    text("D", 124, 58); 
    text("E", 144, 58);
    text("F", 164, 58);
    text("G", 184, 58);
    text("A", 204, 58); 
    text("B", 224, 58);

    text("0", 324, 58);
    text("1", 344, 58);
    text("2", 364, 58);
    text("3", 384, 58);
    text("4", 404, 58);
    text("5", 424, 58);
    text("6", 444, 58);
    text("7", 464, 58);
    text("8", 484, 58);
    text("9", 504, 58);



    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }

  //----------
  //  SONIDO
  //-----------

  void sonido() {

    if (positam==false) {
      if (objeto.isNull("nombre") == false)temp = objeto.getString("nombre"); 
      else temp="";
      positam=true;
    }

    background(200);
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(temp, 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);

    fill(20);
    rect(300, 80, 120, 20);
    if (posy== 80 && mouseX>300 && mouseX<420) {
      fill(100);
      rect(300, 80, 120, 20);
    }
    fill(255);
    text(idiomagui.getString("Seleccionar"), 305, 95);
    stroke(0);
  } // fin sonido

  //----------
  //  Configuración 
  //-----------

  void config() {




    if (mousePressed== true) {
      // boton pantalla
      if (posy== 40 && mouseX>210 && mouseX<300) {
        fullscreen=true;
        configuration.getJSONObject(0).setBoolean("pantallacompleta", true);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
        exit();
        surface.setVisible(false);
      }
      // boton ventana
      if (posy== 40 && mouseX>320 && mouseX<410) {
        fullscreen=false;
        configuration.getJSONObject(0).setBoolean("pantallacompleta", false);


        saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
        exit();
        surface.setVisible(false);
      }

      // boton Website Github
      if (posy== 140 && mouseX>41 && mouseX<131) {
        link("https://github.com/hiteclab/Meta_Processing/releases");
        exit();
        surface.setVisible(false);
      }

      if (mouseY>170 && mouseY<190 && mouseX>360) {
        configuration.getJSONObject(2).setBoolean("activo", true);
        configuration.getJSONObject(3).setBoolean("activo", false);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
      }
      if (mouseY>230 && mouseY<250 && mouseX>360) {
        configuration.getJSONObject(2).setBoolean("activo", false);
        configuration.getJSONObject(3).setBoolean("activo", true);
        saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
      }
    } // fin if mousePressed
    
    
    background(200);
    fill(255);
    //noFill();
    //stroke(80);
    noStroke();
    rect(40,40,400,25);
    rect(40,80,400,25);
    rect(40,110,400,50);
    rect(40,170,400,50);
    rect(40,230,400,25);
    fill(80);
    text(idiomagui.getString("Configuración"), 10, 20); //else text(idiomagui.getString("Variable"), 10, 20);
    text(idiomagui.getString("Tamaño")+" "+idiomagui.getString("Proyecto")+": ", 50, 57);

    // muestra boton Pantalla
    noStroke();
    fill(20);
    if (configuration.getJSONObject(0).getBoolean("pantallacompleta")==true) fill(100);
    rect(210, 40, 90, 20);
    if (posy== 40 && mouseX>210 && mouseX<300) {
      fill(100);
      rect(210, 40, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Pantalla"), 220, 55);

    // muestra boton Ventana
    fill(20);
    if (configuration.getJSONObject(0).getBoolean("pantallacompleta")==false) fill(100);
    rect(320, 40, 90, 20);
    if (posy== 40 && mouseX>320 && mouseX<410) {
      fill(100);
      rect(320, 40, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Ventana"), 330, 55);
    stroke(0);
    
    fill(80);
    text(idiomagui.getString("Velocidad")+" "+idiomagui.getString("Proyecto")+": ", 50, 94);
    fill (0);
    rect(235,80,30,20);
    fill(255);
    text(velocidad, 240, 97);
    
    noStroke();
    fill(0);
    if (posy==80 && mouseX>320 && mouseX<340)fill(100);
    rect(320, 80, 20, 20);
    fill(255);
    text("+", 325, 97);
    
    fill(0);
    if (posy==80 && mouseX>360 && mouseX<380)fill(80);
    rect(360, 80, 20, 20);
    fill(255);
    text("-", 367, 95);

    // muestra boton Website Github
    fill(80);
    String[] actualver = loadStrings(codefolder+"/version.txt");
    text(idiomagui.getString("Nuevo")+" Meta_Processing: "+newver[0], 50, 127);
    noStroke();
    fill(20);
    rect(41, 140, 90, 20);
    if (posy== 140 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 140, 90, 20);
    }
    fill(255);
    text("Website", 50, 155);
    String arduport="";
    int nports=0;
    try { 
      arduport = Arduino.list()[port]; 
      nports=Arduino.list().length;
    } 
    catch (Exception e) {
    };     
    fill(80);
    //text("Arduino "+idiomagui.getString("puerto")+": "+Arduino.list()[port]+"    ( "+port+" / "+Arduino.list()[0].length()+" )", 50, 185);
    text("Arduino "+idiomagui.getString("puerto")+": "+arduport+"    ( "+(port+1)+" / "+nports+" )", 50, 185);
    //text("Arduino "+idiomagui.getString("puerto")+": "+arduport, 50, 185);
    
    text("Arduino "+idiomagui.getString("puerto")+":", 50, 185);

    //fill(255);
    //ellipse(370, 180, 20, 20);
    
    /*
    // resalta casilla seleccion
    if (configuration.getJSONObject(2).getBoolean("activo")) {
      fill(0);
      ellipse(370, 180, 5, 5);
    }
    */

    fill(0);
    if (posy==200 && mouseX>50 && mouseX<70)fill(80);
    rect(50, 200, 20, 20);
    fill(255);
    text("-", 57, 215);

    fill(0);
    if (posy==200 && mouseX>90 && mouseX<110)fill(100);
    rect(90, 200, 20, 20);
    fill(255);
    text("+", 95, 217);

    fill(80);
    text("IP IoTControllerAP: ", 50, 247);
    fill(0);
    rect(220, 230, 140, 20);
    //fill(255);
    //ellipse(370, 240, 20, 20);
    fill(255);
    text(temp+"|", 225, 247); 
    
    /*
    // resalta casilla seleccion
    if (configuration.getJSONObject(3).getBoolean("activo")) {
      fill(0);
      ellipse(370, 240, 5, 5);
    }
    */
  }

  //----------
  //  FORMULA 
  //-----------

  void formula() {


    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        //agregarvar = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = instru;
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==66)renuevaobjeto.setString("instruccion", "formula");
        if (lastid==40)renuevaobjeto.setString("instruccion", "codigonativo");

        if (lastid==66)renuevaobjeto.setString("formula", instru);
        if (lastid==40)renuevaobjeto.setString("codigo", instru);
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    if (lastid==66)text(idiomagui.getString("fórmula"), 10, 20); //else text(idiomagui.getString("Variable"), 10, 20);
    if (lastid==40)text(idiomagui.getString("código")+" "+idiomagui.getString("nativo"), 10, 20); //else text(idiomagui.getString("Variable"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(instru+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }

  //----------
  //  COMENT 
  //-----------

  void coment() {


    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        //agregarvar = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = "//"+instru;
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("comentario", instru);
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Comentario"), 10, 20); //else text(idiomagui.getString("Variable"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(instru+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }


  //----------
  //  VARIABLE 
  //-----------

  void variable() {


    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        agregarvar = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        varenterasnom.append(temp);
        agregarvar = false;

        JSONObject obj = new JSONObject();
        obj.setString("valorinicial", "0");
        obj.setInt("tipo", 0);
        obj.setString("nombre", temp);
        cargavars.append(obj);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");

        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Variable"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(temp+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }


  //----------
  //  VARIABLE INI 
  //-----------

  void variableini() {

    //println(posy);
    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {
        selectvarini = false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {

        selectvarini = false;

        JSONObject obj = new JSONObject();
        obj.setString("valorinicial", temp);
        obj.setInt("tipo", 0);
        obj.setString("nombre", varenterasnom.get(nvarselec));
        cargavars.setJSONObject(nvarselec-7, obj);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");

        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Valor")+" "+idiomagui.getString("Variable")+": "+varenterasnom.get(nvarselec), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    //fill(0,0,255);
    fill(255);
    text(temp+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);

    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }


  //----------
  //  PROYECTO 
  //-----------

  void proyecto() {

    agregarvar= false;
    selectvarini = false;
    opening=false;
    seleidio=false;
    config=false;

    if (mousePressed== true) {
      // boton cancelar
      if (posy== 80 && mouseX>41 && mouseX<131) {

        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 80 && mouseX>170 && mouseX<260) {        

        saveJSONArray(cargacodigo, sketchfolder+"/"+proyectonombre+"/"+proyectonombre+".json");
        saveJSONArray(cargamouse, sketchfolder+"/"+proyectonombre+"/raton.json");
        saveJSONArray(cargateclado, sketchfolder+"/"+proyectonombre+"/teclado.json");
        saveJSONArray(cargaconfiguracion, sketchfolder+"/"+proyectonombre+"/configuracion.json");

        configuration.getJSONObject(1).setInt("cuadros", velocidad);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");
        saveJSONArray(configuration, sketchfolder+"/"+proyectonombre+"/propiedades.json");


        byte[] data = {  }; 
        saveBytes(sketchfolder+"/"+proyectonombre+"/data/data.txt", data); // crea carpeta data en el proyecto

        String[] last = new String[1];
        last = expand(last, 1);
        last[0] =  proyectonombre;
        saveStrings(sketchfolder+"/lastopen.txt", last );
        updatewindowname=true;
              
        // crea archivo de código global llamado global.txt
        String[] global = new String[1];
        global [0] = "// Generated with Meta_Processing Alpha 1.2\n// https://github.com/hiteclab/Meta_Processing/releases\n";
        saveStrings(sketchfolder+proyectonombre+"/global.txt", global);


        exit();
        surface.setVisible(false);
      }
    }
    background(200);
    fill(80);
    text(idiomagui.getString("Proyecto"), 10, 20);
    rect(40, 40, width, 20);  // area de texto valor
    fill(255);
    text(proyectonombre+"|", 42, 55);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 80, 90, 20);
    if (posy== 80 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 95);


    fill(20);
    rect(170, 80, 90, 20);
    if (posy== 80 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 80, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 95);
    stroke(0);
  }



  //--------------
  //   LINEA
  //--------------

  void linea() {
    background(200);

    if (varclicked==true && lastargu==1) {
      px = varenterasnom.get(nvarselec); 
      arguvar1=true; 
      varclicked=false;
    }

    if (varclicked==true && lastargu==2) {
      py = varenterasnom.get(nvarselec); 
      arguvar2=true; 
      varclicked=false;
    }
    if (varclicked==true && lastargu==3) {
      ancho = varenterasnom.get(nvarselec); 
      arguvar3=true; 
      varclicked=false;
    }      
    if (varclicked==true && lastargu==4) {
      alto = varenterasnom.get(nvarselec); 
      arguvar4=true; 
      varclicked=false;
    }  

    if (positam==false) {
      if (objeto.isNull("pxt1") == false) px= ""+objeto.get("pxt1");
      if (objeto.isNull("pxt1v") == false) { 
        px= ""+objeto.get("pxt1v"); 
        arguvar1=true;
      }
      if (objeto.isNull("pyt1") == false) py= ""+objeto.get("pyt1");
      if (objeto.isNull("pyt1v") == false) { 
        py= ""+objeto.get("pyt1v"); 
        arguvar2=true;
      }
      if (objeto.isNull("pxt2") == false) ancho= ""+objeto.get("pxt2");
      if (objeto.isNull("pxt2v") == false) { 
        ancho= ""+objeto.get("pxt2v");
        arguvar3=true;
      }
      if (objeto.isNull("pyt2") == false) alto= ""+objeto.get("pyt2");
      if (objeto.isNull("pyt2v") == false) { 
        alto= ""+objeto.get("pyt2v");
        arguvar4=true;
      }
      positam=true;
    }

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);


    ///* // botones  # y Var ARGUMENTO 1
    fill(255);
    if (posy== 40 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 40, 32, 20); // cuadro var
    fill(255);
    if (posy== 40 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 40, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 2
    fill(255);
    if (posy== 80 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 80, 32, 20); // cuadro var
    fill(255);
    if (posy== 80 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 80, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 3
    fill(255);
    if (posy== 120 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 120, 32, 20); // cuadro var
    fill(255);
    if (posy== 120 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 120, 15, 20); // cuadro #

    ///* // botones  # y Var ARGUMENTO 4
    fill(255);
    if (posy== 160 && mouseX>293 && mouseX<325)fill(80);
    rect(293, 160, 32, 20); // cuadro var
    fill(255);
    if (posy== 160 && mouseX>272 && mouseX<287)fill(80);
    rect(272, 160, 15, 20); // cuadro #

    fill(0);

    text(idiomagui.getString("Posición")+"1 X: ", 30, 55);

    rect(168, 40, 100, 20);  // area de texto valor

    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);

    text(idiomagui.getString("Posición")+"1 Y:", 30, 95);

    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);
    fill(0);


    text(idiomagui.getString("Posición")+"2 X:", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(ancho+"|", 170, 137);
    }
    fill(255);
    text(ancho, 170, 137);
    fill(0);


    text(idiomagui.getString("Posición")+"2 Y:", 30, 175);
    rect(168, 160, 100, 20);  // area de texto
    if (posy== 160||argumentos== 1001000) {
      fill(80);
      rect(168, 160, 100, 20);
      fill(0);
      text(alto+"|", 170, 177);
    }
    fill(255);
    text(alto, 170, 177);


    /// TEXTO DE BOTONES # y VAR
    fill(0);
    text("#   Vr", 272, 55);
    text("#   Vr", 272, 95);
    text("#   Vr", 272, 135);
    text("#   Vr", 272, 175);


    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 220, 90, 20);
    if (posy== 220 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 235);


    fill(20);
    rect(170, 220, 90, 20);
    if (posy== 220 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 220, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 235);
    stroke(0);
  }  // fin linea



  //--------------
  //   TREIANGULO
  //--------------

  void triangulo() {
    background(200);
    if (positam==false) {
      if (objeto.isNull("pxt1") == false) px= ""+objeto.get("pxt1");
      if (objeto.isNull("pyt1") == false) py= ""+objeto.get("pyt1");
      if (objeto.isNull("pxt2") == false) ancho= ""+objeto.get("pxt2");
      if (objeto.isNull("pyt2") == false) alto= ""+objeto.get("pyt2");
      if (objeto.isNull("pxt3") == false) pxt3= ""+objeto.get("pxt3");
      if (objeto.isNull("pyt3") == false) pyt3= ""+objeto.get("pyt3");
      positam=true;
    }


    if (mousePressed==true) { 
      if (posy== 40)  argumentos= 1000001; // casilla x
      if (posy== 80)  argumentos= 1000010; // casilla y
      if (posy== 120) argumentos= 1000100; // casilla ancho
      if (posy== 160) argumentos= 1001000; // casilla alto
      if (posy== 200) argumentos= 1010000; // casilla alto
      if (posy== 240) argumentos= 1100000; // casilla alto
      // boton cancelar
      if (posy== 300 && mouseX>41 && mouseX<131) {
        ventana=false;
        exit();
        surface.setVisible(false);
      }
      // boton aplicar
      if (posy== 300 && mouseX>170 && mouseX<260) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        linea = "triangle( "+px+", "+py+", "+ancho+", "+alto+", "+pxt3+", "+pyt3+" );";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        renuevaobjeto.setString("instruccion", "triangulo");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("pxt1", int(px));
        renuevaobjeto.setInt("pyt1", int(py));
        renuevaobjeto.setInt("pxt2", int(ancho));
        renuevaobjeto.setInt("pyt2", int(alto));
        renuevaobjeto.setInt("pxt3", int(pxt3));
        renuevaobjeto.setInt("pyt3", int(pyt3));
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        ventana=false;
        exit();
        surface.setVisible(false);
      }
    }

    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else text(""+idiomaactual.get(str(lastid)), 10, 20);
    fill(0);

    text(idiomagui.getString("Posición")+"1 X: ", 30, 55);

    rect(168, 40, 100, 20);  // area de texto valor

    if (posy== 40||argumentos== 1000001) {
      fill(80);
      rect(168, 40, 100, 20);
      fill(0);
      text(px+"|", 170, 57);
    }
    fill(255);
    text(px, 170, 57); // muestra valor x

    fill(0);

    text(idiomagui.getString("Posición")+"1 Y:", 30, 95);

    rect(168, 80, 100, 20); // area de texto
    if (posy== 80||argumentos== 1000010) {
      fill(80);
      rect(168, 80, 100, 20);
      fill(0);
      text(py+"|", 170, 97);
    }
    fill(255);
    text(py, 170, 97);
    fill(0);

    text(idiomagui.getString("Posición")+"2 X:", 30, 135);
    rect(168, 120, 100, 20);  // area de texto
    if (posy== 120||argumentos== 1000100) {
      fill(80);
      rect(168, 120, 100, 20);
      fill(0);
      text(ancho+"|", 170, 137);
    }
    fill(255);
    text(ancho, 170, 137);
    fill(0);

    text(idiomagui.getString("Posición")+"2 Y:", 30, 175);
    rect(168, 160, 100, 20);  // area de texto
    if (posy== 160||argumentos== 1001000) {
      fill(80);
      rect(168, 160, 100, 20);
      fill(0);
      text(alto+"|", 170, 177);
    }
    fill(255);
    text(alto, 170, 177);
    fill(0);

    text(idiomagui.getString("Posición")+"3 X:", 30, 215);
    rect(168, 200, 100, 20);  // area de texto
    if (posy== 200||argumentos== 1010000) {
      fill(80);
      rect(168, 200, 100, 20);
      fill(0);
      text(pxt3+"|", 170, 217);
    }
    fill(255);
    text(pxt3, 170, 217);
    fill(0);

    text(idiomagui.getString("Posición")+"3 Y:", 30, 255);
    rect(168, 240, 100, 20);  // area de texto
    if (posy== 240||argumentos== 1100000) {
      fill(80);
      rect(168, 240, 100, 20);
      fill(0);
      text(pyt3+"|", 170, 257);
    }
    fill(255);
    text(pyt3, 170, 257);

    // botones Cancelar y Aplicar
    noStroke();
    fill(20);
    rect(41, 300, 90, 20);
    if (posy== 300 && mouseX>41 && mouseX<131) {
      fill(100);
      rect(41, 300, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Cancelar"), 50, 315);

    fill(20);
    rect(170, 300, 90, 20);
    if (posy== 300 && mouseX>170 && mouseX<260) {
      fill(100);
      rect(170, 300, 90, 20);
    }
    fill(255);
    text(idiomagui.getString("Aplicar"), 180, 315);
    stroke(0);
  }  // fin triangulo


  //--------------
  // COLORSELECTOR
  //--------------

  void colorselector() {    

    if (varclicked==true) { 
      variablecolor=""+varenterasnom.get(nvarselec);
      varclicked=false;
    }

    background(200);
    fill(80);
    if (objeto.isNull("nombre") == false) text(instru, 10, 20); 
    else { 
      text(""+idiomaactual.get(str(lastid)), 10, 20); 
      instruancho= int(textWidth(" "+idiomaactual.get(str(lastid))));
    }
    if (objeto.isNull("color") == false) fill(objeto.getInt("color"));
    if (objeto.isNull("colorh") == false) fill(unhex(objeto.getString("colorh")));

    rect(instruancho+10, 5, 10, 20);
    noStroke();

    if (mousePressed== true) {
      if (mouseX>9 && mouseX<266 && mouseY>39 && mouseY<296) {
        rf=r;
        gf=g;
        bf=b;
      }
      if (mouseX>9 && mouseX<266 && mouseY>295 && mouseY <316) b=mouseX-10;

      if (mouseX>9 && mouseX<266 && mouseY>340) {
        grayf= mouseX-10;
      }

      // boton seleccioar color
      if (mouseX>280 && mouseX <380 && mouseY > 160 && mouseY <180) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (lastid==102) linea = "fill( #"+c+" );";
        if (lastid==98) linea = "background( #"+c+" );";
        if (lastid==115) linea = "stroke( #"+c+" );";
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==102)renuevaobjeto.setString("instruccion", "relleno");
        if (lastid==98)renuevaobjeto.setString("instruccion", "fondo");
        if (lastid==115)renuevaobjeto.setString("instruccion", "colorlinea");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("colorh", "FF"+c);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }

      // boton seleccionar gris
      if (mouseX>280 && mouseX <380 && mouseY > 373 && mouseY <478) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (lastid==102) linea = "fill( "+grayf+" );";
        if (lastid==98) linea = "background( "+grayf+" );";
        if (lastid==115) linea = "stroke( "+grayf+" );";   
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==102)renuevaobjeto.setString("instruccion", "relleno");
        if (lastid==98)renuevaobjeto.setString("instruccion", "fondo");
        if (lastid==115)renuevaobjeto.setString("instruccion", "colorlinea");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setInt("color", grayf);
        renuevaobjeto.setString("pde", linea);
        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }


      // bonton aplicar var
      if (mouseX>280 && mouseX <395 && mouseY > 39 && mouseY <59) {
        JSONObject renuevaobjeto = new JSONObject();
        String linea ="";
        if (lastid==102) linea = "fill( "+variablecolor+" );";
        if (lastid==98) linea = "background( "+variablecolor+" );";
        if (lastid==115) linea = "stroke( "+variablecolor+" );";   
        if (objeto.isNull("para") == false)renuevaobjeto.setBoolean("para", true);
        if (objeto.isNull("si") == false)renuevaobjeto.setBoolean("si", true);
        if (objeto.isNull("sino") == false)renuevaobjeto.setBoolean("sino", true);
        if (objeto.isNull("encapsulado") == false)renuevaobjeto.setBoolean("encapsulado", true);
        if (lastid==102)renuevaobjeto.setString("instruccion", "relleno");
        if (lastid==98)renuevaobjeto.setString("instruccion", "fondo");
        if (lastid==115)renuevaobjeto.setString("instruccion", "colorlinea");
        renuevaobjeto.setInt("id", lastid);
        renuevaobjeto.setString("colorv", variablecolor);
        variablecolor="";

        renuevaobjeto.setString("pde", linea);

        if (codetab==0) cargacodigo.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==1) cargamouse.setJSONObject(lineaclik, renuevaobjeto);         
        if (codetab==2) cargateclado.setJSONObject(lineaclik, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(lineaclik, renuevaobjeto);
        exit();
        surface.setVisible(false);
      }
    }

    // genera matriz de colores
    for (r=40; r<296; r++) {
      for (g=10; g<266; g++) {
        fill(r-40, g-10, b);
        rect(g, r, 1, 1);
      }
    }





    if (mouseX>9 && mouseX<266) g=mouseX-10;
    if (mouseY<296) r=mouseY-40;
    fill(r, g, b);

    if (mouseX>9 && mouseX<266 && mouseY>39 && mouseY<296) {
      stroke(0);
      rect(mouseX, mouseY-10, 10, 10);
    }


    // cuadrado color final
    fill(rf, gf, bf);
    noStroke();
    rect(280, 130, 20, 20);

    // cuadrado color gris
    fill(grayf);
    stroke(0);
    rect(280, 340, 20, 20);
    noStroke();



    // barra selector color
    fill(128);
    rect(10, 296, 255, 20);

    // indicador barra color
    fill(0);
    rect(b+10, 296, 5, 20);

    // barra selector de grises
    for (gray=10; gray<266; gray++) {
      fill(gray-10);
      rect(gray, 340, 1, 20);
    }

    // idicador barra grises
    fill(128);
    rect(grayf+10, 340, 5, 20);

    fill(80);  
    text("Gris: "+grayf, 310, 355);

    c=hex(rf, 2)+hex(gf, 2)+hex(bf, 2);
    text("#FF"+c, 310, 140);

    // boton aplicar var
    fill(80);
    rect(280, 39, 115, 20);

    // boton color
    fill(80);
    rect(280, 160, 115, 20);

    // boton gris
    fill(80);
    rect(280, 373, 115, 20);

    // boton variable
    fill(255);
    rect(280, 10, 32, 20);

    // resalta var
    if (mouseX>280 && mouseX <312 && mouseY > 10 && mouseY <30) {
      fill(128);
      rect(280, 10, 32, 20);
    }


    fill(0);
    text("Vr", 287, 25);


    // resalta boton aplicar var
    if (mouseX>280 && mouseX <395 && mouseY > 39 && mouseY <59) {
      fill(220);
      rect(280, 39, 115, 20);
    }


    // resalta boton color
    if (mouseX>280 && mouseX <395 && mouseY > 160 && mouseY <180) {
      fill(220);
      rect(280, 160, 115, 20);
    }

    // resalta boton gris
    if (mouseX>280 && mouseX <395 && mouseY > 373 && mouseY <478) {
      fill(220);
      rect(280, 373, 115, 20);
    }

    fill(255);

    // boton seleccionar var
    text(idiomagui.getString("Seleccionar"), 282, 54);
    // boton seleccionar color
    text(idiomagui.getString("Seleccionar"), 282, 175);
    // boton seleccionar gris
    text(idiomagui.getString("Seleccionar"), 282, 390);
  } // fin color selector


  //-------------------
  //   INICIO  TYPELIB
  //-------------------

  String typetext(String datos) {

    if (key==BACKSPACE) { 

      if (datos.length() > 0) {
        datos= datos.substring(0, datos.length()-1);
      }
    } else {
      if (key != CODED && keyCode != ENTER)datos= datos+key;
    }

    return datos;
  }

  char typechar(char dato) {

    if (key==BACKSPACE) { 

      dato = ' ';
    } else {
      dato= key;
    }

    return dato;
  }

  String typeint(String datos) {
    if (datos.length() == 0 && key == '-' ) {
      datos= "-";
    } else
      if (key==BACKSPACE) { 

        if (datos.length() > 0) {
          datos= datos.substring(0, datos.length()-1);
        }
      } else {
        if (key == '0' || key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' )
          datos= datos+key;
      }

    return datos;
  }

  String typefloat(String datos) {

    if (key==BACKSPACE) { 

      if (datos.length() > 0) {
        datos= datos.substring(0, datos.length()-1);
      }
    } else {
      if (key == '0' || key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9'||key == '.')
        datos= datos+key;
    }

    return datos;
  }




  void exit()
  {
    // cerrar splash al abrir Meta_Processing
    if (s>50 && opening==true) {
      mainwindow=true;
      codewin=true;
      opening=false;
      surface.setVisible(false);
    }
    mainwindow=true;
    codewin=true;
    seleidio=false;
    ventana=false;
    imagen=false;
    positam=false;
    condicion=false;
    para=false;
    texto=false;
    aleatorio=false;
    arduinoline=false;
    tocanotas=false;
    opening=false;
    dispose();
    wininstru = null;
    agregarvar = false;
    proyecto=false;
    arguvar0=false;
    arguvar1=false;
    arguvar2=false;
    arguvar3=false;
    arguvar4=false;
    arguvar5=false;
    arguvar6=false; // variables para saber si un argumento usa un valor (false) o una varible (true)
    selectvarini = false;
    config=false;
  }
}
