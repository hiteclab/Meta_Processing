// META_PROCESSING Version Alpha 1.2
// (ɔ) 2020  Jose David Cuartas, GPL v.3
// Hiteclab, http://hiteclab.libertadores.edu.co/
// Fundación Universitaria Los Libertadores, Colombia
// Creado usando:
// Processing 3.4 GNU GPL Version 3 The Processing Foundation

// se corrige error que se gerneraba al tratar de eliminar la primeria linea en las pestañas teclado o raton, cuando solo había una linea de código
// se arreglaron errores menores en la interfaz
// se agrega pestaña: Configuración
// se tradruduce automáticamente el nombre de las variables del sistema
// se agreaga instrucción: para
// se agrega opción: definir velocidad en ventana de configuración
// se agrega opción: definir ip  IoTControllerAP en ventana de configuración
// se agrega CTRL+C   para copiar línea
// se agrega CTRL+X   para cortar línea
// se agrega CTRL+V   para pegar línea
// se agrega CTRL+Z   para deshacer última línea borrada
// Se agrega soporte a tarjetas ESP mediante la librería IoTControllerAP ( Instrucciones: salidadigital(), entreadadigital(), entardaanlógica() y servo() en categoría: IoTControllerAP )
// Para descargar la librería IoTControllerAP ir a https://github.com/hiteclab/IoTControllerAP

// PENDIENTE:

// Permitir al usuario personalizar colores interfaz
// encapsular de código
// seleccionar tipo de variable


import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

PWindow3 wininstru;
PWindow4 variables;

int wide=0;
int funcion=0;
JSONArray cargacodigo, cargavars, cargamouse, cargateclado, configuration, cargaconfiguracion;
int linea=1, tlineas=1, lineaanterior=0, linearaton=1, lineaclik=0; // linea es la linea actual, tlineas es el total de líneas a ejecutar
int lineamouse=1, tlineasmouse=1;
int lineateclado=1, tlineasteclado=1;
int lineaconfig=1, tlineasconfig=1;
int nargumentos;
int widthline;
int lineasi, silineas, sinolineas; 
int lineapara, valorini, valorfinal, incremento, paralineas;
int id, idlee;
int i=0;
int idioma=0;
int velocidad;
int codetab=0; // bandera de la pestaña abierta. [ 0 = Principal] [ 1 = raton] [ 2 = teclado ]
int ventatamx, ventatamy;
int pixelsintru, pixelsparam;
StringList varenterasnom, varstringnom, varstringval;
IntList varenterasval;
JSONObject objeto, objetoml, prototipoinstru;
JSONObject objetoactual;
JSONObject idiomaactual, espanol, idiomagui, frances, francesgui, ingles, cree, japones;
int px=0, py=0, tx=0, ty=0, pxt1=0, pyt1=0, pxt2=0, pyt2=0, pxt3=0, pyt3=0;
ArrayList<PImage> images = new ArrayList<PImage>();
String line, temp; // se usa para guarda el texto de cada linea de código
boolean si = false, para = false, video = false, pausa=false, paso=true, ejecuta=false, reinicia = false, inicio=true;
boolean siprincipal =false, siraton=false, siteclado=false;
boolean ventana=false;
boolean imagen=false; // bandera funcion imagen en Ventanas
boolean texto=false; // bandera funcion texto en Ventanas
boolean condicion=false; // bandera funcion condicion en Ventanas
boolean aleatorio=false; // bandera funcion aleatorio en Ventanas
boolean arduinoline=false; // bandera funcion arduino en Ventanas
boolean tocanotas=false; // bandera funcion tocanota en Ventanas
boolean positam=false; // bandera funcion positam en Ventanas
boolean seleidio=false; // bandera funcion seleccion de idioma
String codefolder, sketchfolder;
boolean varibleswin=false;
color resalta=#323232; // 50 escala de grises
int nvarselec; // guarda el numero de la variable seleccionada
boolean arguvar1=false, arguvar2=false, arguvar3=false, arguvar4=false, arguvar5=false, arguvar6=false; // variables para saber si un argumento usa un valor (false) o una varible (true)  
int lastargu;
boolean arguvar0=false; // para casilla de texto en funcion texto
boolean opening=true;
boolean varclicked=false; // bandera para saber cuando se seleciona una variable en la ventana de variables
boolean runwindow=false;
boolean onetime=true;
boolean codewin=false;
boolean salir=false; // bandera para salir del programa al presionar el boton salir
boolean proyecto=false; // bandera para seleccionar nombre del proyecto al presionar boton nuevo
String proyectonombre="";
PImage iconos; // varialble que contiene la imagen con los iconos de la la interfaz
int s; // contador segundos splash
boolean mainwindow=false;
boolean agregarvar=false;
boolean eliminavar=false;
boolean updatewindowname=false;
String metafolder;
String variablecolor;
boolean selectvarini=false; // bandera para saber que la variable se seleccionó para definir su valor inicial
boolean existe = false; // bandera de existencia de archivo lastopen
boolean existeproyecto=false; // bandera de existencia de proyecto
boolean config=false; // bandera para abrir configuración
boolean fullscreen=false;
String[] newver = new String[1];
int y, posy;
boolean libminim = false, libvideo = false, libarduino =false;
color fondo =  #000000, fondobarrasup = #323232, fondoresalta= #323232, fondotabsresalta= #323232, fondotabs = #000000, fondobarrainf = #505050; 
int port=0;
int icodigo=0, imouse=0, iteclado=0, iconfig=0; // numero de linea desde la cual se muestra el código.
int mouseid=0;
int maximolineas=0; // Guarda el numero máximo de lineas que se puede mostrar en el tamaño actual de la ventana. Si la ventana es de y=800 entonces para este valor de y maximolineas es 34
int lineaactual=0;
boolean muestrabloque=true; //bandera para mostra u oculatar bloque de código
boolean ctrlPressed; // bandera para saber si se presionó la tecla ctrl
boolean ctrlzactive= false; // esta bandera solo se activa si se elimina una línea de código

JSONObject ctrlcline = new JSONObject();
JSONObject lastdeletelineobj = new JSONObject();
int lastdeleteline=-1;
boolean iot=false; // bandera iotcontroller
boolean ardu=false; // bandera Arduino Board


  /*
Grayscale  =   RGB
   80         = FF505050
   50         = FF323232
   0          = FF000000
   128        = FF808080
   20         = FF141414
   */


  void setup() {
    
    surface.setResizable(true);
    surface.setSize(700,800);
    surface.setTitle(" ");
    //surface.setLocation(100, 10);
    
    if(mainwindow==false) surface.setVisible(false); // oculta la ventana de ejecución de código para mostrar al abri Metaprocessing solo el splah

    textFont(createFont("Arial Unicode MS",17));
    configuracion();
    
    // abre el splash
    wininstru = new PWindow3();
    
  }

  void draw() {
   maximolineas=(height-111)/20;
   
   if(mouseY>40){
   posy= mouseY-mouseY % 20;
    
   y= ((posy-40)/20)+1;
   
   
   if (codetab==0 && icodigo+(y-1)<tlineas && mouseY<height-71)lineaactual=icodigo+(y-1);
   if (codetab==1 && imouse+(y-1)<tlineasmouse && mouseY<height-71)lineaactual=imouse+(y-1);
   if (codetab==2 && iteclado+(y-1)<tlineasteclado && mouseY<height-71)lineaactual=iteclado+(y-1);
   if (codetab==3 && iconfig+(y-1)<tlineasconfig && mouseY<height-71)lineaactual=iconfig+(y-1);
   }
   
    // muesta la ventana de código al cerrar el splash 
    if (onetime==true && codewin==true) {
      surface.setVisible(true); 
      onetime=false;
      surface.setTitle(proyectonombre);
    }
    
    // actualiza el nombre de la ventana cada vez que se abre un nuevo proyecto
   if (updatewindowname==true) {
      surface.setTitle(proyectonombre);
      updatewindowname=false;
    }    
    
    background(fondo); //0

    // resalta línea en la que se hizo click
    fill(fondoresalta); // 50
    noStroke();
    /*
    if (codetab==0)rect(0, 22+20*((lineaclik+1)-icodigo), width, 20);
    if (codetab==1)rect(0, 22+20*((lineaclik+1)-imouse), width, 20);
    if (codetab==2)rect(0, 22+20*((lineaclik+1)-iteclado), width, 20);
    */
    
    if (codetab==0)rect(0, 22+20*((lineaclik+1)-icodigo), width, 20);
    if (codetab==1)rect(0, 22+20*((lineaclik+1)-imouse), width, 20);
    if (codetab==2)rect(0, 22+20*((lineaclik+1)-iteclado), width, 20);
    if (codetab==3)rect(0, 22+20*((lineaclik+1)-iconfig), width, 20);
    
    stroke(128);

    // se calcula la linea que esta señalando el raton
    textSize(18);




        
    if (y>0 && tlineas >= icodigo+y ) {

      
      /*
      if (codetab==0)leelinea(lineaactual);
      if (codetab==1)leelinea(lineaactual);
      if (codetab==2)leelinea(lineaactual);
      if (codetab==3)leelinea(lineaactual);
      */
      
      leelinea(lineaactual);
      
      // se calcula el tamaño en pixels de la linea
      widthline = int(textWidth(""+line));

      
          // resalta linea que apunta el mouse solo hasta el final de la línea
          fill(fondobarrainf); //80
          rect(0, 22+20*y, widthline+40, 20);
          //if (codetab==0) rect(0, 22+20*(y-icodigo), widthline+40, 20);
    }
    
    


    /*
    // Resalta linea en ejecucion al presionar boton parar
    if (lineaanterior!=0) { 
      fill(resalta);
      rect(40, 22+(20*lineaanterior), width, 20);
    }
    */
    
    numera();

    if (codetab==0) {
      tlineas = cargacodigo.size(); 
      for (int i = icodigo; i< tlineas; i++) {
        objetoml = cargacodigo.getJSONObject(i);
        
        
        muestralinea(i);
        if( objetoml.getInt("id") == 99 && objetoml.getBoolean("visible") == false){i= objetoml.getInt("final")-1; }
      }
      
    }

    if (codetab==1) {
      tlineasmouse = cargamouse.size();
      tlineas = tlineasmouse;
      for (int i=imouse; i< tlineasmouse; i++) {
        objetoml = cargamouse.getJSONObject(i);

        muestralinea(i);
      }
    }

    if (codetab==2) {
      tlineasteclado = cargateclado.size(); 
      tlineas = tlineasteclado;
      for (int i=iteclado; i< tlineasteclado; i++) {
        objetoml = cargateclado.getJSONObject(i);

        muestralinea(i);
      }
    }

    if (codetab==3) {
      tlineasconfig = cargaconfiguracion.size(); 
      tlineas = tlineasconfig;
      for (int i=iconfig; i< tlineasconfig; i++) {
        objetoml = cargaconfiguracion.getJSONObject(i);

        muestralinea(i);
      }
    }


    // botones subir y bajar código
    pushStyle();
    strokeJoin(ROUND);
    //noFill();
    stroke(80);
    strokeWeight(2);
    fill(#323232);
    if(mouseX>width-21 && mouseY<60 && mouseY>40)fill(120);
    rect(width-21, 40, 20, 20, 7); // boton arriba
    fill(255);
    text("^",width-15,60);
    strokeWeight(1);
    
    
    stroke(80);
    strokeWeight(2);
    fill(#323232);
    if(mouseX>width-21 && mouseY<height-45 && mouseY>height-65)fill(120);
    rect(width-21,height-65, 20, 20, 7); // boton arriba
    fill(255);
    textSize(14);
    text("v",width-15,height-50);
    strokeWeight(1);
    
    popStyle();
    // fin botones subir y bajar código


    // barra inferior
    fill(fondotabs); // 0
    stroke(128);
    rect(0, height-71, 400, height ); // Pestaña configuración
    rect(0, height-71, 270, height ); // Pestaña Teclado
    rect(0, height-71, 180, height ); // Pestaña Ratón
    rect(0, height-71, 100, height ); // Pestaña codigo Principal
    fill(fondotabsresalta); // 50
    if (codetab==0 || mouseX<100 && mouseY > height-71 && mouseY < height)rect(0, height-71, 100, height ); // Resalta pestaña Código Principal
    if (codetab==1 || mouseX > 100 && mouseX < 180 && mouseY > height-71 && mouseY < height)rect(100, height-71, 80, height ); // Resalta pestaña Raton
    if (codetab==2 || mouseX > 180 && mouseX < 270 && mouseY > height-71 && mouseY < height)rect(180, height-71, 90, height ); // Resalta pestaña Teclado
    if (codetab==3 || mouseX > 270 && mouseX < 400 && mouseY > height-71 && mouseY < height)rect(270, height-71, 130, height ); // Resalta pestaña configuación
    fill(128);
    text(idiomagui.getString("Principal"), 10, height-51);
    text(idiomagui.getString("Ratón"), 110, height-51);
    text(idiomagui.getString("Teclado"), 185, height-51);
    text(idiomagui.getString("Configuración"), 280, height-51);
    fill(fondobarrainf); //80
    rect(0, height-45, width, height ); // 30
    // fin barra inferior
    
    
        // barra superior    
    pushStyle();

    fill(fondobarrasup); // 0
    stroke(80);
    strokeWeight(2);
    rect(0, 0, width, 40);
    stroke(255);
    strokeJoin(ROUND);
    noFill();
    strokeWeight(2);

    triangle(20, 10, 20, 30, 40, 20); // boton ejecutar
    
    rect(245, 10, 20, 24); // boton variable

    
 
      // reslata boton variables
    if (mouseX>245 && mouseX<265 && mouseY>10 && mouseY<34) {
      fill(128);
      stroke(255);
      rect(245, 10, 20, 24); // boton variable
      fill(255); 
      text(idiomagui.getString("Variables"),15, height-22);
    }
    
    fill(255);
    text("V",249,29); 
    
     // reslata boton + variable
    if (mouseX>270 && mouseX<282 && mouseY>10 && mouseY<20) {
      fill(50);
      stroke(255);
      rect(270, 10, 10, 10);
      fill(255); 
      text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Variable"),15, height-22);
    }
    // resalta boton - variable
    if (mouseX>270 && mouseX<282 && mouseY>25 && mouseY<35) {
      fill(50);
      stroke(255);
      rect(270, 25, 10, 10);
      fill(255); 
      text(idiomagui.getString("Eliminar")+" "+idiomagui.getString("Variable"),15, height-22);
    }
    
    text("+",268,22);
    text("-",272,35);
    
    noStroke();
    
    // resalta ejecutar
    if (mouseX>20 && mouseX<40 && mouseY>10 && mouseY<30) {
      fill(128);
      triangle(20, 10, 20, 30, 40, 20); // boton ejecutar
      fill(255); 
      text(idiomagui.getString("Ejecutar"),15, height-22);
    }
    

    // resalta boton capeta data
    if (mouseX>300 && mouseX<325 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(300, 10, 26, 25);
      fill(255);
      text("Data",15, height-22);
    }

    // resalta boton Nuevo
    if (mouseX>350 && mouseX<375 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(350, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Nuevo"),15, height-22);
    }    


    // resalta boton Abrir
    if (mouseX>400 && mouseX<425 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(400, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Abrir"),15, height-22);
    }    

    // resalta boton guardar
    if (mouseX>450 && mouseX<475 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(450, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Guardar"),15, height-22);
    }


    // resalta boton exportar
    if (mouseX>500 && mouseX<525 && mouseY>10 && mouseY<30) {
      fill(128); 
      rect(500, 10, 26, 25);
      fill(255);
      text(idiomagui.getString("Exportar"),15, height-22);
    }

    // resalta boton idioma
    if (mouseX>600 && mouseX<625 && mouseY>10 && mouseY<30) { 
      fill(128); 
      noStroke();
      rect(600, 10, 25, 25); 
      fill(255); 
      text(idiomagui.getString("Idioma"),15, height-22);
    }

    // resalta boton Configuración
    if (mouseX>650 && mouseX<675 && mouseY>10 && mouseY<30) { 
      fill(128); 
      noStroke();
      rect(650, 10, 25, 25); 
      fill(255); 
      text(idiomagui.getString("Configuración"),15, height-22);
    }



    image(iconos, 0, 10);


    popStyle();
  // fin barra superior
    
    
//////////////////////
//bototones agregar
/////////////////////

    if (y>0 && y <=tlineas && mouseY<height-71 && tlineas >= icodigo+y ) {

      
      //if(y<=maximolineas)linearaton=y; 
      if (codetab==0) if(icodigo+(lineaactual)<= maximolineas) linearaton=y; 
      if (codetab==1) if(imouse+(lineaactual)<= maximolineas) linearaton=y; 
      if (codetab==2) if(iteclado+(lineaactual)<= maximolineas) linearaton=y; 
      if (codetab==3) if(iconfig+(lineaactual)<= maximolineas) lineaconfig=y; 

      JSONObject objeto;
      objeto = new JSONObject();
      // aquí se carga la instruccion a la que apunta el raton y se carga el id de dicha instrucción
      if (codetab==0) objeto = cargacodigo.getJSONObject(lineaactual);
      if (codetab==1) objeto = cargamouse.getJSONObject(lineaactual);
      if (codetab==2) objeto = cargateclado.getJSONObject(lineaactual);
      if (codetab==3) objeto = cargaconfiguracion.getJSONObject(lineaactual);
      int id = objeto.getInt("id");
      mouseid = id;
      fill(50);

      
      //leelinea(linearaton-1);
      /*
      if (codetab==0)leelinea(lineaactual);
      if (codetab==1)leelinea(lineaactual);
      if (codetab==2)leelinea(lineaactual);
      if (codetab==3)leelinea(lineaactual);
      */
      
      leelinea(lineaactual);
      
      // se calcula el tamaño en pixels de la linea
      widthline = int(textWidth(""+line));

      // resalta linea que apunta el mouse solo hasta el final de la línea
      //rect(0, 22+20*y, widthline+40, 20);

      // muestra boton agregar línea
      if (mouseX>widthline+50 && mouseX<widthline+70) {
        noStroke();

        if (id== 111 || objeto.isNull("para") == false || id==105 || objeto.isNull("si") == false || objeto.isNull("sino") == false) {
          fill(0, 0, 255); 
          quad(widthline+50, (33+20*y), widthline+60, (33+20*y)+10, widthline+70, (33+20*y), widthline+60, (33+20*y)-10);
          fill(255);
          if (id==105 || objeto.isNull("si") == false ) text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Si"),15, height-22);
          else if (objeto.isNull("sino") == false) text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Sino"),15, height-22);
          else if (id== 111 || objeto.isNull("para") == false) text(idiomagui.getString("Agregar")+" "+idiomaactual.get(str(111)),15, height-22);
        } else {
          fill(#1BF50C);
          ellipse(widthline+60, 33+20*y, 20, 20);
          fill(255);
          text(idiomagui.getString("Agregar"),15, height-22);
        }

        fill(0);
        text("+", widthline+53, 37+20*y);
        stroke(128);
      }

      // muestra boton agregar sino dede linea si
      if (mouseX>widthline+140 && mouseX<widthline+160) {
        
        if (objeto.isNull("si") == false ) { 
          fill(#FFEC12); 
          //fill(255);
          quad(widthline+140, (33+20*y), widthline+150, (33+20*y)+10, widthline+160, (33+20*y), widthline+150, (33+20*y)-10);
          //text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Sino"),15, height-22);  
        }
        fill(255);
        if( objeto.isNull("si") == false || objeto.isNull("sino") == false){
          text(idiomagui.getString("Agregar")+" "+idiomagui.getString("Sino"),15, height-22);  
          fill(0);
          text("+", widthline+143, 37+20*y);
          stroke(128);
        }
      }



      // muestra boton eliminar línea
      if (mouseX>widthline+80 && mouseX<widthline+100) {

        fill(255, 0, 0);
        line(40, 33+20*y, widthline+85, 33+20*y);
        noStroke();
        ellipse(widthline+90, 33+20*y, 20, 20);
        fill(0);
        text("-", widthline+85, 37+20*y);
        stroke(128);
        fill(255);
        text(idiomagui.getString("Eliminar"),15, height-22);
      }   

      // muesta boton agregar línea fuera del if
      if (mouseX>widthline+110 && mouseX<widthline+130) {
        if (objeto.isNull("si") == false || objeto.isNull("sino") == false || objeto.isNull("para") == false) {
          fill(#1BF50C);
          //fill(128);
          ellipse(widthline+120, 33+20*y, 20, 20);
          fill(0);
          text("+", widthline+113, 37+20*y);
          fill(255);
          text(idiomagui.getString("Agregar"),15, height-22);
        }        
        
      }


    }
    
    
    
      // Muestra prototipo de la instrucción en la barra inferior
      fill(255);
      
      if (mouseY > 40 && mouseX<widthline+40 && tlineas >= icodigo+y)text(prototipoinstru.getString(str(mouseid)),15, height-22);


//Ftext(icodigo+"  "+(linearaton-1)+"   "+lineaactual,mouseX, mouseY);

  } // fin void draw()
  
  void keyPressed() {
    if (keyCode==ESC)exit();
    
    if (keyCode == CONTROL){ 
      ctrlPressed = true;
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // convinacion CTRL + tecla // el caracter de la tecla va en Mayuscula para que funcione pero reconoce la tecla tanto en miniscula y mayuscula
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////
    // Copiar línea
    ////////////////
    if (ctrlPressed && keyCode == int('C') ) {
      println("ctrl+c");
      
      if (codetab==0) ctrlcline = cargacodigo.getJSONObject(lineaactual); 
      if (codetab==1) ctrlcline = cargamouse.getJSONObject(lineaactual); 
      if (codetab==2) ctrlcline = cargateclado.getJSONObject(lineaactual); 
      if (codetab==3) ctrlcline = cargaconfiguracion.getJSONObject(lineaactual); 
      //println(ctrlcline);
      ctrlPressed = false;
    }
    
    ////////////////
    // Pegar línea
    ////////////////
    if (ctrlPressed && keyCode == int('V') ) {
      println("ctrl+v");      
      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (lineaactual+1==tlineas) {
          cargacodigo.append(ctrlcline);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(ctrlcline);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineasmouse) {
          cargamouse.append(ctrlcline);
          tlineasmouse++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(ctrlcline);
          for (int i=linearaton; i<tlineasmouse; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineasmouse++;
          cargamouse = temp;
        }
      }

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineasteclado) {
          cargateclado.append(ctrlcline);
          tlineasteclado++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(ctrlcline);
          for (int i=linearaton; i<tlineasteclado; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineasteclado++;
          cargateclado = temp;
        }
      }
      
      
      // agrega línea en pestaña CONFIGURACION
      if (codetab==3) {
        if (linearaton==tlineasconfig) {
          cargaconfiguracion.append(ctrlcline);
          tlineasconfig++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          temp.append(ctrlcline);
          for (int i=linearaton; i<tlineasconfig; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          tlineasconfig++;
          cargaconfiguracion = temp;
        }
      } // fin configuracion
      
      ctrlPressed = false;
    }

    ////////////////
    // Cortar linea
    ////////////////
    if (ctrlPressed && keyCode == int('X') ) {
      println("ctrl+x");

      if (codetab==0) ctrlcline = cargacodigo.getJSONObject(lineaactual); 
      if (codetab==1) ctrlcline = cargamouse.getJSONObject(lineaactual); 
      if (codetab==2) ctrlcline = cargateclado.getJSONObject(lineaactual); 
      if (codetab==3) ctrlcline = cargaconfiguracion.getJSONObject(lineaactual); 
      
      
         // pestaña principal
        if (codetab==0) { 
          cargacodigo.remove(lineaactual);
          tlineas--;
          lineaactual--;
        }
        // pestaña raton
        if (codetab==1) { 
          cargamouse.remove(lineaactual);
          tlineasmouse--;
          lineaactual--;
        }
        // pestaña teclado
        if (codetab==2) { 
          cargateclado.remove(lineaactual); 
          tlineasteclado--;
          lineaactual--;
        }
        // pestaña configuracion
        if (codetab==3) { 
          cargaconfiguracion.remove(lineaactual); 
          tlineasconfig--;
          lineaactual--;
        }
        
      
      ctrlPressed = false;
    }
    
    //////////////////////
    // deshacer eleiminar
    //////////////////////
    if (ctrlPressed && keyCode == int('Z') && ctrlzactive== true ) {
      println("ctrl+z");
      //println(tlineas);
      
      
      
      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (lastdeleteline==tlineas) { // caso penultima línea
          cargacodigo.append(lastdeletelineobj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<lastdeleteline; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(lastdeletelineobj);
          for (int i=lastdeleteline; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (lastdeleteline==tlineasmouse) { // caso penultima línea
          cargamouse.append(lastdeletelineobj);
          tlineasmouse++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<lastdeleteline; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(lastdeletelineobj);
          for (int i=lastdeleteline; i<tlineasmouse; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineasmouse++;
          cargamouse = temp;
        }
      }

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (lastdeleteline==tlineasteclado) { // caso penultima línea
          cargateclado.append(lastdeletelineobj);
          tlineasteclado++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<lastdeleteline; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(lastdeletelineobj);
          for (int i=lastdeleteline; i<tlineasteclado; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineasteclado++;
          cargateclado = temp;
        }
      }
      
      
      // agrega línea en pestaña CONFIGURACION
      if (codetab==3) {
        if (lastdeleteline==tlineasconfig) { // caso penultima línea
          cargaconfiguracion.append(lastdeletelineobj);
          tlineasconfig++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<lastdeleteline; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          temp.append(lastdeletelineobj);
          for (int i=lastdeleteline; i<tlineasconfig; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          tlineasconfig++;
          cargaconfiguracion = temp;
        }
      } // fin configuracion
      
      
      
      ctrlzactive= false;
      ctrlPressed = false;
    } 
    
  } // fin void keypressed

  void mousePressed() {

    
    // Boton pestaña: Principal   // bandera de la pestaña abierta. [ 0 = Principal] [ 1 = raton] [ 2 = teclado ]
    if (mouseX<100 && mouseY > height-71 && mouseY < height) {
      codetab=0; // Resalta pestaña Código Principal
      tlineas = cargacodigo.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
    }
    // Boton pestaña: Raton
    if (mouseX > 100 && mouseX < 180 && mouseY > height-71 && mouseY < height) {
      codetab=1; // Resalta pestaña Raton
      tlineas = cargamouse.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      lineamouse=1; 
      tlineasmouse=1;
    }
    // Boton pestaña: Teclado
    if (mouseX > 180 && mouseX < 270 && mouseY > height-71 && mouseY < height) {
      codetab=2; // Resalta pestaña Teclado
      tlineas = cargateclado.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      lineateclado=1; 
      tlineasteclado=1;
    }

    // Botón pestaña: Configuación
    if (mouseX > 270 && mouseX < 400 && mouseY > height-71 && mouseY < height){
      codetab=3; // Resalta pestaña Configuación
      tlineas = cargaconfiguracion.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      lineaconfig=1;
      tlineasconfig=1;
      
    }
    



     // boton variables
    if (mouseX>245 && mouseX<265 && mouseY>10 && mouseY<34) {
      selectvarini = true;  
      variables = new PWindow4();
        
    }

     // agregar + variable
    if (mouseX>270 && mouseX<282 && mouseY>10 && mouseY<20) {
      agregarvar = true;
      temp="";
      wininstru = new PWindow3();
    
    }

    // eliminar - variable
    if (mouseX>270 && mouseX<282 && mouseY>25 && mouseY<35) {
      eliminavar=true;
      variables = new PWindow4();
    }
    
    
    
    // boton ejecuta
    if (mouseX>20 && mouseX<40 && mouseY>10 && mouseY<30) {
      println("Ejecuta");
      fill(0,255,0);
      triangle(20, 10, 20, 30, 40, 20); // boton ejecutar
      guardameta();
      guardapde(1);
      
      
      String OS = System.getProperty("os.name").toLowerCase(); 
      
      if( OS.contains("linux") == true) {        
      String[] command = {"/bin/bash", "-c", "sh "+metafolder+"/processing/processing-java --sketch="+sketchfolder+proyectonombre+" --force --run"};
      Process p= exec(command); 
      } 
      
      if( OS.contains("windows") == true) {
        String[] command = { "cmd", "/c", metafolder+"/processing/processing-java --sketch="+sketchfolder+proyectonombre+" --force --run"};
        Process p= exec(command); 
      }  
      
      if( OS.contains("mac") == true) {
        //String commandToRun = "/usr/local/bin/processing-java --sketch="+sketchfolder+proyectonombre+" --force --run";
        String commandToRun = metafolder+"processing-java --sketch="+sketchfolder+proyectonombre+" --force --run";
        //String[] commandToRun = {"."+metafolder+"processing-java --sketch="+sketchfolder+proyectonombre+" --force --run"};
        println(commandToRun);
        File workingDir = new File(metafolder);   // where to do it - should be full path
        try {Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);} catch (Exception e) {}
      }
      
    }
    

    // boton capeta data
    if (mouseX>300 && mouseX<325 && mouseY>10 && mouseY<30) {
      
      String OS = System.getProperty("os.name").toLowerCase(); 
      
      if( OS.contains("linux") == true) {
        String[] command = {"/bin/bash", "-c", "xdg-open "+sketchfolder+proyectonombre+"/data"}; 
        Process p= exec(command); // abre carpeta sketch
      } 
      
      if( OS.contains("windows") == true) {
        String[] command = { "cmd", "/c", "explorer" , sketchfolder+proyectonombre+"\\data"};
        Process p= exec(command); // abre carpeta sketch
      }  
      
      if( OS.contains("mac") == true) {
        launch("/System/Library/CoreServices/Finder.app", sketchfolder+proyectonombre+"/data");
      }
      
    }

    // boton Nuevo
    if (mouseX>350 && mouseX<375 && mouseY>10 && mouseY<30) {
      println("Nuevo proyecto");
      proyecto = true;
      

      cargavars = new JSONArray();

      wininstru = new PWindow3();

      JSONObject renuevaobjeto = new JSONObject();
      renuevaobjeto.setInt("id", -1);


      linea=1; 
      tlineas=1;
      lineamouse=1; 
      tlineasmouse=1;
      lineateclado=1; 
      tlineasteclado=1;
      lineaconfig=1;
      tlineasconfig=1;
      reinicia=true;
      linea = 1;
      lineaanterior=0;
      pausa=false;
      paso=true;
      ejecuta=false; 
      inicio=true;
      runwindow=false;
      codetab=0;
      port=0;
      icodigo=0;
      imouse=0;
      iteclado=0;
      iconfig=0;
      maximolineas=0; 
      lineaactual=0;
       
      line=""+idiomaactual.get(str(-1));
      idlee=-1;


      cargacodigo = new JSONArray();
      cargamouse = new JSONArray();
      cargateclado = new JSONArray();
      cargaconfiguracion = new JSONArray();

      varenterasnom = new StringList();
      creavariables();
      cargacodigo.setJSONObject(0, renuevaobjeto); 
      cargamouse.setJSONObject(0, renuevaobjeto);         
      cargateclado.setJSONObject(0, renuevaobjeto);
      cargaconfiguracion.setJSONObject(0, renuevaobjeto);
      

      
      guardameta();
      guardapde(1);

      
    }

    // boton Abrir
    if (mouseX>400 && mouseX<425 && mouseY>10 && mouseY<30) {

      elegircarpeta();
      
    }

    // Boton guardar
    if (mouseX>450 && mouseX<475 && mouseY>10 && mouseY<30) {
      println("Guarda");
      guardameta();
      saveJSONArray(cargacodigo, sketchfolder+proyectonombre+"/"+proyectonombre+".json");
      saveJSONArray(cargamouse, sketchfolder+proyectonombre+"/raton.json");
      saveJSONArray(cargateclado, sketchfolder+proyectonombre+"/teclado.json");
      
      configuration.getJSONObject(1).setInt("cuadros",velocidad);
      //configuration.getJSONObject(1).setInt("pueto",port);
      saveJSONArray(cargavars, sketchfolder+proyectonombre+"/variables.json");
      saveJSONArray(configuration, sketchfolder+proyectonombre+"/propiedades.json");
      saveJSONArray(cargaconfiguracion, sketchfolder+proyectonombre+"/configuracion.json");
      
      byte[] data = {  }; saveBytes(sketchfolder+"/"+proyectonombre+"/data/data.txt", data); // crea carpeta data en el proyecto
      
    }

    // boton exportar
    if (mouseX>500 && mouseX<525 && mouseY>10 && mouseY<30) {
      println("Exporta");
      guardameta();
      guardapde(1);
      
      String OS = System.getProperty("os.name").toLowerCase(); 
      
      if( OS.contains("linux") == true) {
        String[] command = {"/bin/bash", "-c", "sh "+metafolder+"/processing/processing-java --sketch="+sketchfolder+proyectonombre+" --output="+sketchfolder+proyectonombre+"/app"+" --force --export"};
        Process p= exec(command); 
      } 
      
      if( OS.contains("windows") == true) {
        String[] command = { "cmd", "/c", metafolder+"/processing/processing-java --sketch="+sketchfolder+proyectonombre+" --output="+sketchfolder+proyectonombre+"\\app"+" --force --export"};
        Process p= exec(command); 
      }  
      
      if( OS.contains("mac") == true) {
        //String commandToRun = "/usr/local/bin/processing-java --sketch="+sketchfolder+proyectonombre+"/app"+" --force --export";
        String commandToRun = metafolder+"processing-java --sketch="+sketchfolder+proyectonombre+"/app"+" --force --export";
        File workingDir = new File(metafolder);   // where to do it - should be full path
        try {Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);} catch (Exception e) {}
        //launch("processing-java --sketch="+sketchfolder+proyectonombre+" --output="+sketchfolder+proyectonombre+"/app"+" --force --export");
      }
      
      
    } // fin boton exportar
    ////////////////////////////////////////////////////////////////////////////////////////////////////////

    // boton language
    if (mouseX>600 && mouseX<625 && mouseY>10 && mouseY<30) { 
      seleidio=true; 
      wininstru = new PWindow3();
    }

    // boton Configuración
    if (mouseX>650 && mouseX<675 && mouseY>10 && mouseY<30) {
      temp= configuration.getJSONObject(3).getString("ip");
      config=true;
      wininstru = new PWindow3();
      // consulta en internet la ultima versión publicada de Metrapocessing
      if(loadStrings("https://raw.githubusercontent.com/hiteclab/Meta_Processing/master/MetaProcessing/data/version.txt") != null)newver = loadStrings("https://raw.githubusercontent.com/hiteclab/Meta_Processing/master/MetaProcessing/data/version.txt"); else newver[0] = "";
  } // Fin boton Configuración



    ///////////////////////
    // Boton agregar línea
    ///////////////////////

    // Boton normal agergar línea

    if (mouseX>widthline+50 && mouseX<widthline+70 && mouseY>40 && mouseY< height-72 && tlineas >= icodigo+y) {

      // lee ide de la linea de código donde se hizo click para agregar nueva linea
      JSONObject objeto;
      objeto = new JSONObject();
      if (codetab==0) objeto = cargacodigo.getJSONObject(lineaactual); 
      if (codetab==1) objeto = cargamouse.getJSONObject(lineaactual); 
      if (codetab==2) objeto = cargateclado.getJSONObject(lineaactual); 
      if (codetab==3) objeto = cargaconfiguracion.getJSONObject(lineaactual); 
      
      int idclick = objeto.getInt("id");
      // Fin lee ide de la linea de código donde se hizo click para agregar nueva linea

      JSONObject obj = new JSONObject();
      obj.setInt("id", -1);

      if (objeto.isNull("sino") == false) obj.setInt("sino", 1); // le agrega al nuevo objeto la propieda SINO en caso de agregarse una nueva línead desde un IF
      if (objeto.isNull("si") == false || idclick == 105 )obj.setInt("si", 1); // le agrega al nuevo objeto la propieda SI en caso de agregarse una nueva línead desde un IF
      if (objeto.isNull("para") == false || idclick == 111 )obj.setInt("para", 1); // le agrega al nuevo objeto la propieda SI en caso de agregarse una nueva línead desde un IF
      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (lineaactual+1==tlineas) {
          cargacodigo.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineasmouse) {
          cargamouse.append(obj);
          tlineasmouse++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineasmouse; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineasmouse++;
          cargamouse = temp;
        }
      }

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineasteclado) {
          cargateclado.append(obj);
          tlineasteclado++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineasteclado; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineasteclado++;
          cargateclado = temp;
        }
      }
      
      
      // agrega línea en pestaña CONFIGURACION
      if (codetab==3) {
        if (linearaton==tlineasconfig) {
          cargaconfiguracion.append(obj);
          tlineasconfig++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineasconfig; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          tlineasconfig++;
          cargaconfiguracion = temp;
        }
      } // fin configuracion
      
    } // Fin Boton normal agergar línea


    // boton verde agergar línea en SI y SINO
    //if( objetoml.isNull("si") == false || objetoml.isNull("sino") == false) 
    if( y<=tlineas && mouseX>widthline+110 && mouseX<widthline+130 && mouseY>40 && mouseY< height-72 && tlineas >= icodigo+y) {
      JSONObject obj = new JSONObject();
      obj.setInt("id", -1);


      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (linearaton==tlineas) {
          cargacodigo.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineas) {
          cargamouse.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineas++;
          cargamouse = temp;
        }
      } // fin raton

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineas) {
          cargateclado.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineas++;
          cargateclado = temp;
        }
      } // fin teclado
      

      // agrega línea en pestaña CONFIGURACION
      if (codetab==3) {
        if (linearaton==tlineas) {
          cargaconfiguracion.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          tlineas++;
          cargaconfiguracion = temp;
        }
      } // fin configuracion
      
      
    } // fin agregar verde en SI y SINO



    // boton agregar sino dede linea si
    //if( objetoml.isNull("si") == false || objetoml.isNull("sino") == false) 
    if (mouseY>40 && mouseY< height-72 && mouseY<width && y<=tlineas && mouseX>widthline+140 && mouseX<widthline+160 && tlineas >= icodigo+y) {
      JSONObject obj = new JSONObject();
      obj.setInt("id", -1);
      obj.setInt("sino", 1);


      // agrega línea en pestaña PRINCIPAL
      if (codetab==0) {
        if (linearaton==tlineas) {
          cargacodigo.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargacodigo.getJSONObject(i));
          }
          tlineas++;
          cargacodigo = temp;
        }
      }

      // agrega línea en pestaña RATON
      if (codetab==1) {
        if (linearaton==tlineas) {
          cargamouse.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargamouse.getJSONObject(i));
          }
          tlineas++;
          cargamouse = temp;
        }
      } // fin raton

      // agrega línea en pestaña TECLADO
      if (codetab==2) {
        if (linearaton==tlineas) {
          cargateclado.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargateclado.getJSONObject(i));
          }
          tlineas++;
          cargateclado = temp;
        }
      } // fin teclado
      

      // agrega línea en pestaña CONFIGURACION
      if (codetab==3) {
        if (linearaton==tlineas) {
          cargateclado.append(obj);
          tlineas++;
        } else {
          JSONArray temp = new JSONArray();

          for (int i=0; i<linearaton; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          temp.append(obj);
          for (int i=linearaton; i<tlineas; i++) {
            temp.append(cargaconfiguracion.getJSONObject(i));
          }
          tlineas++;
          cargaconfiguracion = temp;
        }
      } // fin configuracion
      
    }


    ////////////////////////
    // boton eliminar línea
    /////////////////////////

    if (mouseX>widthline+80 && mouseX<widthline+100 && mouseY>40 && mouseY< height-72 && tlineas >= icodigo+y) {
      
      // codigo guarda en memoria la linea que se va eleminar para pode deshacer en caso de equivocación
      if (codetab==0) lastdeletelineobj = cargacodigo.getJSONObject(lineaactual); 
      if (codetab==1) lastdeletelineobj = cargamouse.getJSONObject(lineaactual); 
      if (codetab==2) lastdeletelineobj = cargateclado.getJSONObject(lineaactual); 
      if (codetab==3) lastdeletelineobj = cargaconfiguracion.getJSONObject(lineaactual); 
      lastdeleteline = lineaactual;
      //println(lastdeleteline);
      ctrlzactive= true;
      // Fin codigo guarda en memoria la linea que se va eleminar
      
      
     if(lineaactual==0 && tlineas==1){

        linea=1; 
        tlineas=1;
        lineaanterior=0;
        JSONObject renuevaobjeto = new JSONObject();
        renuevaobjeto.setInt("id", -1);
        if (codetab==0) cargacodigo.setJSONObject(0, renuevaobjeto);
        if (codetab==1) cargamouse.setJSONObject(0, renuevaobjeto);
        if (codetab==2) cargateclado.setJSONObject(0, renuevaobjeto);
        if (codetab==3) cargaconfiguracion.setJSONObject(0, renuevaobjeto);

      } else {
      
      //if (linearaton>1 || tlineas>1) {
        
        // pestaña principal
        if (codetab==0) { 
          cargacodigo.remove(lineaactual);
          tlineas--;
          lineaactual--;
        }
        // pestaña raton
        if (codetab==1) { 
          cargamouse.remove(lineaactual);
          tlineasmouse--;
          lineaactual--;
        }
        // pestaña teclado
        if (codetab==2) { 
          cargateclado.remove(lineaactual); 
          tlineasteclado--;
          lineaactual--;
        }
        // pestaña configuracion
        if (codetab==3) { 
          cargaconfiguracion.remove(lineaactual); 
          tlineasconfig--;
          lineaactual--;
        }
        
      } // fin else
      //} 
      

    }


    // Abre la ventana de la instrucción en la que se hizo click con el boton izquierdo
    if (y < tlineas+1 && ventana==false && mouseButton==LEFT && mouseX < widthline+40 && mouseY>40 && mouseY< height-70 ) {
      ventana=true;
      
      /*
      if(codetab==0) lineaclik = icodigo+linearaton-1;
      if(codetab==1) lineaclik = imouse+linearaton-1;
      if(codetab==2) lineaclik = iteclado+linearaton-1;
      */
      
      /*
      if(codetab==0) lineaclik = lineaactual;
      if(codetab==1) lineaclik = lineaactual;
      if(codetab==2) lineaclik = lineaactual;
      if(codetab==3) lineaclik = lineaactual;
      */
      
      lineaclik = lineaactual;
      
      ventatamx = 550;
      wininstru = new PWindow3();
    }

// Botón subir o Flecha Arriba reduce i (volver al inicio del códogio - primera línea)

    if(mouseX>width-21 && mouseY<60 && mouseY>40){
      //linearaton=1;
        if(codetab==0 && icodigo > 0) icodigo--; // codigo
        if(codetab==1 && imouse > 0) imouse--;  // mouse
        if(codetab==2 && iteclado > 0) iteclado--; // teclado
        if(codetab==3 && iconfig > 0) iconfig--; // configuracion
    }
    
// Botón Flecha Abajo: aumenta i (ir al final del códogo - última línea)

    if(mouseX>width-21 && mouseY<height-45 && mouseY>height-65){ 
      linearaton=1;
        if(codetab==0){ // codigo
            if( icodigo < tlineas-maximolineas && tlineas>maximolineas)icodigo++; 
        }
        if(codetab==1){ // mouse
            if( imouse < tlineasmouse-maximolineas && tlineasmouse>maximolineas) imouse++;  
        }
        if(codetab==2){ // teclado
            if( iteclado < tlineasteclado-maximolineas && tlineasteclado>maximolineas)iteclado++; 
        }
        if(codetab==3){ // configuracion
            if( iconfig < tlineasconfig-maximolineas && tlineasconfig>maximolineas)iconfig++; 
        }
    }

  } // fin void mousePressed

void mouseWheel(MouseEvent event) {
  //float e = event.getCount();

// Botón Flecha Arriba reduce i (volver al inicio del códogio - primera línea)

    if(event.getCount()<0){
      //linearaton=1;
        if(codetab==0 && icodigo > 0) icodigo--; // codigo
        if(codetab==1 && imouse > 0) imouse--;  // mouse
        if(codetab==2 && iteclado > 0) iteclado--; // teclado
        if(codetab==3 && iconfig > 0) iconfig--; // configuracion
    }
    
// Botón Flecha Abajo: aumenta i (ir al final del códogo - última línea)

    if(event.getCount()>0){ 
      linearaton=1;
        if(codetab==0){ // codigo
            if( icodigo < tlineas-maximolineas && tlineas>maximolineas)icodigo++; 
            //if(icodigo < tlineas && tlineas<35) icodigo++; 
        }
        if(codetab==1){ // mouse
            if( imouse < tlineasmouse-maximolineas && tlineasmouse>maximolineas) imouse++;  
            //if( imouse < tlineasmouse && tlineasmouse<35) imouse++;  
        }
        if(codetab==2){ // teclado
            if( iteclado < tlineasteclado-maximolineas && tlineasteclado>maximolineas)iteclado++; 
            //if ( iteclado < tlineasteclado && tlineasteclado<35) iteclado++; 
        }
        if(codetab==3){ // configuracion
            if( iconfig < tlineasconfig-maximolineas && tlineasconfig>maximolineas)iconfig++; 
        }
        
    }


}



///////////////////////////
///     NUMERA
//////////////////////////

  void numera() {
    fill(180);
    if(codetab==0) for (int i=icodigo; i<tlineas; i++ ) text(i+1, 5, 60+((20*i)-(20*icodigo))); // numera pestaña código
    if(codetab==1) for (int i=imouse; i<tlineasmouse; i++ ) text(i+1, 5, 60+((20*i)-(20*imouse))); // numera pestaña mouse
    if(codetab==2) for (int i=iteclado; i<tlineasteclado; i++ ) text(i+1, 5, 60+((20*i)-(20*iteclado))); // numera pestaña teclado
    if(codetab==3) for (int i=iconfig; i<tlineasconfig; i++ ) text(i+1, 5, 60+((20*i)-(20*iconfig))); // numera pestaña configuracion
    
  }
  
//////////////////////////////////


  //---------------------
  //  INICIO MUESTRALINEA 
  //----------------------
  void muestralinea(int i) {

    int id = objetoml.getInt("id");
    int widthlinenow;

    leelinea(i);
    widthlinenow = int(textWidth(""+line));
    pushStyle();
    fill(255);
    if (id==0 || id==99) fill(0, 0, 255);
    if (id==102||id==115||id==98) {
      if (objetoml.isNull("color") == false) {
        fill(objetoml.getInt("color"));
        rect(widthlinenow+37, 22+20*(i+1), 10, 20);
        fill(255);
      } else 
      if (objetoml.isNull("colorh") == false) {
        fill(unhex(objetoml.getString("colorh")));
        //rect(widthlinenow+37, 22+20*(i+1), 10, 20);
        if(codetab==0)rect(widthlinenow+37, 22+((20*(i+1))-(20*icodigo)), 10, 20);  //text(line, 40, 60+((20*(i+1))-(20*icodigo) ));
        if(codetab==1)rect(widthlinenow+37, 22+((20*(i+1))-(20*imouse)), 10, 20); 
        if(codetab==2)rect(widthlinenow+37, 22+((20*(i+1))-(20*iteclado)), 10, 20); 
        if(codetab==3)rect(widthlinenow+37, 22+((20*(i+1))-(20*iconfig)), 10, 20); 
        fill(255);
      } else 
      if (objetoml.isNull("colorv") == false) {
        fill(255);
        rect(widthlinenow+37, 22+20*(i+1), 10, 20);
        fill(255);
      }
    } // id 102

    if(codetab==0)text(line, 40, 60+((20*i)-(20*icodigo) ));
    if(codetab==1)text(line, 40, 60+((20*i)-(20*imouse) ));
    if(codetab==2)text(line, 40, 60+((20*i)-(20*iteclado) ));
    if(codetab==3)text(line, 40, 60+((20*i)-(20*iconfig) ));
    
    
    fill(#F5AB0A);
    if (objetoml.isNull("instruccion") == false) {

      if (objetoml.isNull("para") == false) {

          //text("    "+idiomaactual.get(str(id)), 40, 60+(20*i));
          
          if(codetab==0)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*icodigo) ));
          if(codetab==1)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*imouse) ));
          if(codetab==2)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iteclado) ));
          if(codetab==3)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iconfig) ));


      } else if (objetoml.isNull("si") == false) {

          //text("    "+idiomaactual.get(str(id)), 40, 60+(20*i));
          
          if(codetab==0)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*icodigo) ));
          if(codetab==1)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*imouse) ));
          if(codetab==2)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iteclado) ));
          if(codetab==3)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iconfig) ));


      } else if (objetoml.isNull("sino") == false) {

          fill(255); 
          //text(""+idiomagui.get("Sino"), 40, 60+(20*i));
          if(codetab==0)text(""+idiomagui.get("Sino"), 40, 60+((20*i)-(20*icodigo) ));
          if(codetab==1)text(""+idiomagui.get("Sino"), 40, 60+((20*i)-(20*imouse) ));
          if(codetab==2)text(""+idiomagui.get("Sino"), 40, 60+((20*i)-(20*iteclado) ));
          if(codetab==3)text(""+idiomagui.get("Sino"), 40, 60+((20*i)-(20*iconfig) ));
          
          
          fill(#F5AB0A);  
          //text(""+idiomaactual.get(str(id)), 40+textWidth("           "), 60+(20*i));
          
          if(codetab==0)text(""+idiomaactual.get(str(id)), 40+textWidth("           "), 60+((20*i)-(20*icodigo) ));
          if(codetab==1)text(""+idiomaactual.get(str(id)), 40+textWidth("           "), 60+((20*i)-(20*imouse) ));
          if(codetab==2)text(""+idiomaactual.get(str(id)), 40+textWidth("           "), 60+((20*i)-(20*iteclado) ));
          if(codetab==3)text(""+idiomaactual.get(str(id)), 40+textWidth("           "), 60+((20*i)-(20*iconfig) ));


      } else {
        if (objetoml.isNull("encapsulado") == true) {
          
          
          if(codetab==0)text(""+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*icodigo) ));
          if(codetab==1)text(""+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*imouse) ));
          if(codetab==2)text(""+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iteclado) ));
          if(codetab==3)text(""+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iconfig) ));
          
        } else { 
          //text("    "+idiomaactual.get(str(id)), 40, 60+(20*i));
          if(codetab==0)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*icodigo) ));
          if(codetab==1)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*imouse) ));
          if(codetab==2)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iteclado) ));
          if(codetab==3)text("    "+idiomaactual.get(str(id)), 40, 60+((20*i)-(20*iconfig) ));
        }
      }
    }

    popStyle();
  } // fin muestralinea

  void exit()
  {
     wininstru=null;
     variables=null;
     System.exit(0);
    dispose();
  }
  
   //////////////////
  ///  GUARDA META
  ////////////////// 
  
void guardameta(){
      println("Guarda código Meta");
      String[] metaconfiguracion, metateclado, metaraton, metaprincipal;

      metaconfiguracion= new String[1];
      metateclado= new String[1];
      metaraton= new String[1];
      metaprincipal= new String[1];
      metaconfiguracion[0] ="";
      metateclado[0] ="";
      metaraton[0] ="";
      metaprincipal[0] ="";

      codetab=3; // configuracion
      for (int i=1; i-1<tlineasconfig; i++) {
        leelinea(i-1);
        if (cargaconfiguracion.getJSONObject(i-1).isNull("sino") == false)metaconfiguracion[0] = metaconfiguracion[0]+idiomagui.getString("Sino");
        metaconfiguracion[0] = metaconfiguracion[0]+line+"\n";
      }
      saveStrings(sketchfolder+proyectonombre+"/meta/configuracion.meta", metaconfiguracion);
      
      
      codetab=2; // teclado
      for (int i=1; i-1<tlineasteclado; i++) {
        leelinea(i-1);
        if (cargateclado.getJSONObject(i-1).isNull("sino") == false)metateclado[0] = metateclado[0]+idiomagui.getString("Sino");
        metateclado[0] = metateclado[0]+line+"\n";
      }
      saveStrings(sketchfolder+proyectonombre+"/meta/teclado.meta", metateclado);
      
      codetab=1;  // raton
      for (int i=1; i-1<tlineasmouse; i++) {
        leelinea(i-1);
        if (cargamouse.getJSONObject(i-1).isNull("sino") == false)metaraton[0] = metaraton[0]+idiomagui.getString("Sino");
        metaraton[0] = metaraton[0]+line+"\n";
      }
      saveStrings(sketchfolder+proyectonombre+"/meta/raton.meta", metaraton);
      
      codetab=0; // principal
      tlineas = cargacodigo.size();
      for (int i=1; i-1<tlineas; i++) {
        leelinea(i-1);
        if (cargacodigo.getJSONObject(i-1).isNull("sino") == false)metaprincipal[0] = metaprincipal[0]+idiomagui.getString("Sino");
        metaprincipal[0] = metaprincipal[0]+line+"\n";
      }
      saveStrings(sketchfolder+proyectonombre+"/meta/principal.meta", metaprincipal);
      
}  
  
  //////////////////
  ///  GUARDA PDE
  //////////////////
  
  void guardapde(int modo){
  
      if (codetab!=0) codetab =0;
      tlineas = cargacodigo.size();
      linea=1;
      lineaanterior=0;
      linearaton=1; 
      lineaclik=0;
      libminim = false; 
      libvideo = false;
      libarduino = false;

      String[] texto, textof, lib, setup, setupf;
      

      
      // EXPORTAR KEYPRESSED()
      texto = new String[1];
      textof = new String[1]; 
      texto = expand(texto,1);
      texto[0]="";
      textof = expand(textof, 1);
      for (int i=1; i-1<tlineasteclado; i++) {
        if (cargateclado.getJSONObject(i-1).isNull("pde") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";

          if (cargateclado.getJSONObject(i-1).isNull("para") == false)texto [i-1] ="    ";
          if (cargateclado.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; 
          if (cargateclado.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        ";

          if (cargateclado.getJSONObject(i-1).isNull("sino") == false && i>2 && cargateclado.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargateclado.getJSONObject(i-1).getString("pde"); 
          
          // cuando la siguiente linea está por fuera de la estructura algorítmica
          if (cargateclado.getJSONObject(i-1).isNull("para") == false && i<tlineasteclado && cargateclado.getJSONObject(i).isNull("para") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargateclado.getJSONObject(i-1).isNull("si") == false && i<tlineasteclado && cargateclado.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargateclado.getJSONObject(i-1).isNull("sino") == false && i<tlineasteclado && cargateclado.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          
          // cuando es la ultima línea en la pestaña
          if (cargateclado.getJSONObject(i-1).isNull("para") == false && i==tlineasteclado )texto [i-1] = texto [i-1]+"\n    }";  
          if (cargateclado.getJSONObject(i-1).isNull("si") == false && i==tlineasteclado )texto [i-1] = texto [i-1]+"\n    }";
          if (cargateclado.getJSONObject(i-1).isNull("sino") == false && i==tlineasteclado )texto [i-1] = texto [i-1]+"\n        }";
          
          if (cargateclado.getJSONObject(i-1).getInt("id") == 100 ) { // sonido
            libminim=true;
          }
          if (cargateclado.getJSONObject(i-1).getInt("id") == 118) { // video
            libvideo=true;
          }
          if (cargateclado.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }      
          if (cargateclado.getJSONObject(i-1).getInt("id") == 10) { // salidadigital
            libarduino=true;
          }  
          
        }// fin if
      } // fin for      
      
      textof [0] = "void keyPressed(){\nif (keyCode==ESC)exit();\ntecla=key;\n";
      
      textof = concat(textof, texto);

      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n}"; // cierra la función keyPressed()

      //if(modo==0)saveStrings(codefolder+"/temp/teclado.pde", textof);
      if(modo==1)saveStrings(sketchfolder+proyectonombre+"/teclado.pde", textof);

      // EXPORTAR MOUSEPRESSED()
      texto = new String[1];
      textof = new String[1]; 
      textof = expand(textof, 1);
      texto = expand(texto,1);
      texto[0]="";
      for (int i=1; i-1<tlineasmouse; i++) {
        if (cargamouse.getJSONObject(i-1).isNull("pde") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";

          if (cargamouse.getJSONObject(i-1).isNull("para") == false)texto [i-1] ="    "; //else texto [i-1] ="";
          if (cargamouse.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; //else texto [i-1] ="";
          if (cargamouse.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        "; //else texto [i-1] ="";

          if (cargamouse.getJSONObject(i-1).isNull("sino") == false && i>2 && cargamouse.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargamouse.getJSONObject(i-1).getString("pde"); 
          
          // cuando la siguiente linea está por fuera de la estructura algorítmica
          if (cargamouse.getJSONObject(i-1).isNull("para") == false && i<tlineasmouse && cargamouse.getJSONObject(i).isNull("para") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargamouse.getJSONObject(i-1).isNull("si") == false && i<tlineasmouse && cargamouse.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargamouse.getJSONObject(i-1).isNull("sino") == false && i<tlineasmouse && cargamouse.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          
          // cuando es la ultima línea en la pestaña
          if (cargamouse.getJSONObject(i-1).isNull("para") == false && i==tlineasmouse )texto [i-1] = texto [i-1]+"\n    }";
          if (cargamouse.getJSONObject(i-1).isNull("si") == false && i==tlineasmouse )texto [i-1] = texto [i-1]+"\n    }";
          if (cargamouse.getJSONObject(i-1).isNull("sino") == false && i==tlineasmouse )texto [i-1] = texto [i-1]+"\n        }";
          
          if (cargamouse.getJSONObject(i-1).getInt("id") == 100 ) { // sonido
            libminim=true;
          }
          if (cargamouse.getJSONObject(i-1).getInt("id") == 118) { // video
            libvideo=true;
          }
          if (cargamouse.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }
          if (cargamouse.getJSONObject(i-1).getInt("id") == 10) { // salidadigital
            libarduino=true;
          }          
        }// fin if
      } // fin for      
      textof [0] = "void mousePressed(){\n click=mouseButton;\n";
      textof = concat(textof, texto);

      textof = expand(textof, textof.length+1);
      textof [textof.length-1]= "\n}"; // cierra la función mousePressed()

      //if(modo==0)saveStrings(codefolder+"/temp/mouse.pde", textof);
      if(modo==1)saveStrings(sketchfolder+proyectonombre+"/mouse.pde", textof);



      // EXPORTAR SETUP()
      setupf = new String[1];
      setupf = expand(setupf,1);
      texto = new String[1];
      textof = new String[1]; 
      textof = expand(textof, 1);
      texto = expand(texto,1);
      texto[0]="";
      for (int i=1; i-1<tlineasconfig; i++) {
        if (cargaconfiguracion.getJSONObject(i-1).isNull("pde") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";

          if (cargaconfiguracion.getJSONObject(i-1).isNull("para") == false)texto [i-1] ="    "; //else texto [i-1] ="";
          if (cargaconfiguracion.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; //else texto [i-1] ="";
          if (cargaconfiguracion.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        "; //else texto [i-1] ="";

          if (cargaconfiguracion.getJSONObject(i-1).isNull("sino") == false && i>2 && cargaconfiguracion.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargaconfiguracion.getJSONObject(i-1).getString("pde"); 
          
          // cuando la siguiente linea está por fuera de la estructura algorítmica
          if (cargaconfiguracion.getJSONObject(i-1).isNull("para") == false && i<tlineasconfig && cargaconfiguracion.getJSONObject(i).isNull("para") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargaconfiguracion.getJSONObject(i-1).isNull("si") == false && i<tlineasconfig && cargaconfiguracion.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargaconfiguracion.getJSONObject(i-1).isNull("sino") == false && i<tlineasconfig && cargaconfiguracion.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          
          // cuando es la ultima línea en la pestaña
          if (cargaconfiguracion.getJSONObject(i-1).isNull("para") == false && i==tlineasconfig )texto [i-1] = texto [i-1]+"\n    }";
          if (cargaconfiguracion.getJSONObject(i-1).isNull("si") == false && i==tlineasconfig )texto [i-1] = texto [i-1]+"\n    }";
          if (cargaconfiguracion.getJSONObject(i-1).isNull("sino") == false && i==tlineasconfig )texto [i-1] = texto [i-1]+"\n        }";
          
          if (cargaconfiguracion.getJSONObject(i-1).getInt("id") == 100 ) { // sonido
            libminim=true;
          }
          if (cargaconfiguracion.getJSONObject(i-1).getInt("id") == 118) { // video
            libvideo=true;
          }
          if (cargaconfiguracion.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }
          if (cargaconfiguracion.getJSONObject(i-1).getInt("id") == 10) { // salidadigital
            libarduino=true;
          }          
        }// fin if
      } // fin for      
      textof [0] = "void setup(){\n";
      textof = concat(textof, texto);
      setupf = textof;   
      
      //textof = expand(textof, textof.length+1);
      //textof [textof.length-1]= "\n}"; // cierra la función mousePressed()

      //if(modo==0)saveStrings(codefolder+"/temp/mouse.pde", textof);
      //if(modo==1)saveStrings(sketchfolder+proyectonombre+"/configuracion.pde", textof);




      // EXPORTAR DRAW()
      texto = new String[1];
      textof = new String[1];
      lib = new String[1];
      setup = new String[1];
      texto = expand(texto,1);
      texto[0]="";
      setup = expand(setup, 1);
      lib = expand(lib, 1);
      lib[0]="";
      setup[0]="";
      

      for (int i=1; i-1<tlineas; i++) {
        if (cargacodigo.getJSONObject(i-1).isNull("pde") == false) {
          texto = expand(texto, i);
          texto [i-1] ="";

          if (cargacodigo.getJSONObject(i-1).isNull("para") == false)texto [i-1] ="    "; 
          if (cargacodigo.getJSONObject(i-1).isNull("si") == false)texto [i-1] ="    "; 
          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false)texto [i-1] ="        "; 

          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false && i>2 && cargacodigo.getJSONObject(i-2).isNull("si") == false)texto [i-1] = texto [i-1]+"else {\n        ";

          texto [i-1] = texto [i-1]+cargacodigo.getJSONObject(i-1).getString("pde"); 
          
          // cuando la siguiente linea está por fuera de la estructura algorítmica
          if (cargacodigo.getJSONObject(i-1).isNull("para") == false && i<tlineas && cargacodigo.getJSONObject(i).isNull("para") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargacodigo.getJSONObject(i-1).isNull("si") == false && i<tlineas && cargacodigo.getJSONObject(i).isNull("si") == true)texto [i-1] = texto [i-1]+"\n    }";
          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false && i<tlineas && cargacodigo.getJSONObject(i).isNull("sino") == true)texto [i-1] = texto [i-1]+"\n        }";
          
          // cuando es la ultima línea en la pestaña
          if (cargacodigo.getJSONObject(i-1).isNull("para") == false && i==tlineas )texto [i-1] = texto [i-1]+"\n    }";
          if (cargacodigo.getJSONObject(i-1).isNull("si") == false && i==tlineas )texto [i-1] = texto [i-1]+"\n    }";
          if (cargacodigo.getJSONObject(i-1).isNull("sino") == false && i==tlineas )texto [i-1] = texto [i-1]+"\n        }";
          
          if (cargacodigo.getJSONObject(i-1).getInt("id") == 100 ) { // sonido
            libminim=true;
          }
          if (cargacodigo.getJSONObject(i-1).getInt("id") == 118) { // video
            libvideo=true;
          }
          if (cargacodigo.getJSONObject(i-1).getInt("id") == 110) { // tocanota
            libminim=true;
          }
          if (cargacodigo.getJSONObject(i-1).getInt("id") == 10) { // salidadigital
            libarduino=true;
          }          
        }// fin if
      } // fin for
      
      //lib[0]=lib[0]+"// Generated with Meta_Processing Alpha 1.2\n// https://github.com/hiteclab/Meta_Processing/releases\n";
      

      
      if (libminim==true) {
        lib[0]=lib[0]+"\nimport ddf.minim.*;\n";
      }
      if (libvideo==true) {
        lib[0]=lib[0]+"\nimport processing.video.*;\nboolean inivideo=false;\n";
      }
      if (libarduino==true) {
        lib[0]=lib[0]+"\nimport processing.serial.*;\nimport cc.arduino.*;\n\n Arduino arduino;\n";
      }
      textof = expand(texto, 1);
      textof [0] = lib[0];

    textof [0] =textof [0] +"\nfloat ";
    for (int i=0; i< varenterasnom.size(); i++) {
      if(i<7)fill(120); else fill(255);
      
      if(i< varenterasnom.size()-1){
          textof [0] =textof [0] +varenterasnom.get(i)+"=";
          if(i>7)textof [0] =textof [0] +cargavars.getJSONObject(i-7).getString("valorinicial"); else textof [0] =textof [0] +"0";
          textof [0] =textof [0] +","; 
        } else if(i>6) textof [0] =textof [0] +varenterasnom.get(i)+"="+cargavars.getJSONObject(i-7).getString("valorinicial")+";\n"; else textof [0] =textof [0] +varenterasnom.get(i)+"=0;";
              
    }
            

      if (libvideo==true)textof [0] = textof [0]+"\nMovie movie;";

      if (libminim==true)textof [0] = textof [0]+"\nMinim canal; \nAudioOutput nota;";

      textof [0] = textof [0]+"\n\n void settings() { ";
      if(fullscreen==false) textof [0] = textof [0]+"\nsize(displayWidth, displayHeight);";
      if(fullscreen==true) textof [0] = textof [0]+"\nfullScreen();";
      
    
      textof [0] = textof [0]+" \n}\n";
      //textof [0] = textof [0]+"\n\n void settings() { \nsize(displayWidth, displayHeight); \n}\n\n void setup(){";
      
      setupf [0] = setupf [0]+setup[0];
      if(fullscreen==false) setupf [0] = setupf [0]+"\nsurface.setResizable(true);";
      setupf [0] = setupf [0]+" \nframeRate("+velocidad+");\n";
      if (libarduino==true) {
        setupf [0]=setupf [0]+"try { arduino = new Arduino(this, Arduino.list()["+port+"], 57600); } catch (Exception e) { exit(); }\n"; // se inicia la lectura del puerto 0 para controlar el arduino
      }

      if (libminim==true) setupf [0] = setupf [0]+"\n canal = new Minim(this);\n nota = canal.getLineOut();\n nota.setTempo( 60 );\n nota.playNote( 0.7, 0);";
      
    
  
      //setupf [0]=setupf [0]+"\n }";// cierra setup
      
      setupf = expand(setupf, setupf.length+1);
      setupf [setupf.length-1]= "\n}"; // cierra la función setup()
      
      
      //setupf [0] = setupf [0]+"\n }"; // cierra setup
      saveStrings(sketchfolder+proyectonombre+"/configuracion.pde", setupf); // gurda archivo setup
      
      

      textof [0] = textof [0]+"\nvoid draw(){\n\n ratonX=mouseX; \n ratonY=mouseY; \n ancho=width; \n alto=height; \n";


      texto [texto.length-1]=  texto [texto.length-1] + "\n}"; // cierra la función draw()
      
      textof =concat(textof, texto);

      // agrega al final leer video
      if (libvideo==true) {
        lib[0]="\n\nvoid movieEvent(Movie m) { \n m.read(); \n}";
        textof = concat(textof, lib);
      }
      
      // con estas dos línas se agrega el codígo global que se puede agregar en el archivo global.txt ubicado en la raiz del proyecto
      String[] readglobal = loadStrings(sketchfolder+proyectonombre+"/global.txt");
      textof = concat(readglobal, textof);

      //if(modo==0) saveStrings(codefolder+"/temp/temp.pde", textof);
      if(modo==1) saveStrings(sketchfolder+proyectonombre+"/"+proyectonombre+".pde", textof);
            
      // FIN EXPORTAR DRAW()
  
  
  }




void eligearchivo() {
  selectInput(idiomagui.getString("Archivo"), "fileSelected", dataFile(sketchfolder+proyectonombre+"/data/*.*" ));
}

void elegircarpeta() {
  File folderToStartFrom = new File( sketchfolder );
  selectFolder(idiomagui.getString("Proyecto"), "folderSelected", folderToStartFrom);
}

//------------------------
//   INICIO  fileSelected
//------------------------

void fileSelected(File selection) {
  if (selection != null) { 
    String loadPath = selection.getAbsolutePath();
    // divide en fragmentos la ruta y los guarda en vector de llamado "lista" - el ultimo fragmento es el nombre del archivo
    String OS = System.getProperty("os.name").toLowerCase(); 
    String[] lista = new String[1];
    if( OS.contains("linux") == true || OS.contains("mac") == true){
    lista = splitTokens(loadPath, "/"); 
    }
    if( OS.contains("windows") == true){
    lista = splitTokens(loadPath, "\\");
    }
    int nslash=(lista.length)-1; // determina la cantidad de slash en la ruta
    temp = lista[nslash]; //se guarda el nombre del archivo seleccionado
  }
}    


void folderSelected(File selection) {
  if (selection != null) {
    String ruta = selection.getAbsolutePath();
    
    String OS = System.getProperty("os.name").toLowerCase(); 
    String[] lista = new String[1];
    if( OS.contains("linux") == true || OS.contains("mac") == true){
      lista = splitTokens(ruta, "/"); 
    }
    if( OS.contains("windows") == true){
      lista = splitTokens(ruta, "\\"); 
    }
    int nslash=(lista.length)-1; // determina la cantidad de slash en la ruta
    ruta = lista[nslash]; //se guarda el nombre de la carpeta seleccionado
    proyectonombre= ruta;
    cargacodigo = loadJSONArray(sketchfolder+proyectonombre+"/"+proyectonombre+".json");
    cargamouse = loadJSONArray(sketchfolder+proyectonombre+"/"+"/raton.json");
    cargateclado = loadJSONArray(sketchfolder+proyectonombre+"/teclado.json");
    configuration = loadJSONArray(sketchfolder+"/"+proyectonombre+"/propiedades.json");
    cargaconfiguracion = loadJSONArray(sketchfolder+"/"+proyectonombre+"/configuracion.json");
    cargavars = loadJSONArray(sketchfolder+"/"+proyectonombre+"/variables.json");
          
    if (configuration.getJSONObject(0).getBoolean("pantallacompleta") == false) { 
      fullscreen=false;
    } else fullscreen=true;
    velocidad= configuration.getJSONObject(1).getInt("cuadros");
    port= configuration.getJSONObject(2).getInt("puerto");
    
    tlineas = cargacodigo.size();
    tlineasmouse = cargamouse.size();
    tlineasteclado = cargateclado.size(); 
    tlineasconfig = cargaconfiguracion.size(); 
    
    icodigo=0;
    imouse=0;
    iteclado=0;
    iconfig=0;
    maximolineas=0;
    lineaactual=0;
    
    linea=1;
    lineamouse=1;
    lineateclado=1;
    
    linearaton=1; 
    lineaclik=0;
    
    // esta parte actualiza el archivo lastopen.txt con el proyecto abierto
    String[] last = new String[1];
    last = expand(last, 1);
    last[0] =  proyectonombre;
    saveStrings(sketchfolder+"/lastopen.txt", last );
    
    // se cargan nuevamente las variables
    cargavars = loadJSONArray(sketchfolder+"/"+proyectonombre+"/variables.json");
    varenterasnom = new StringList();
    creavariables();
    surface.setTitle(proyectonombre);
  }
}


//---------------------
//  INICIO LEELINEA 
//----------------------

void leelinea(int i) {
  JSONObject objeto;
  objeto = new JSONObject();

  if (codetab==0) objeto = cargacodigo.getJSONObject(i); 
  if (codetab==1) objeto = cargamouse.getJSONObject(i); 
  if (codetab==2) objeto = cargateclado.getJSONObject(i); 
  if (codetab==3) objeto = cargaconfiguracion.getJSONObject(i); 
  
  objetoactual = objeto;

  int id = objeto.getInt("id");

  idlee=id;
  nargumentos = objeto.size()-2;

  if (id==-1) {
    line=""+idiomaactual.get(str(id));
  }  

  if (objeto.isNull("instruccion") == false) {
    line=""+idiomaactual.get(str(id));
  }
  
  // muestra comentario
  if (id==0) {
    line = "//"+objeto.get("comentario");
  } else 
  
  // muestra formula
  if (id==66) {
    line = ""+objeto.get("formula");
  } else 
  
  // muestra condigo nativo
  if (id==40) {
    line = ""+objeto.get("codigo");
  } else 
  
  // muestra código encapsulado
  if (id==99) {
    line=""+idiomaactual.get(str(id))+" "+objeto.get("capsula");
  } else
  
  // muestra salidadigital Arduino
  if (id==10) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("valor")+" ) ";
  } else
  
  // muestra entradadigital Arduino
  if (id==11) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("variable")+" ) ";
  } else
  
  // muestra entradaanalogica Arduino
  if (id==12) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("variable")+" ) ";
  } else
  
  // muestra entradaanalogica Arduino
  if (id==13) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("variable")+" ) ";
  } else

  // muestra salidadigital IoTControllerAP
  if (id == -10) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("valor")+" ) IoTControllerAP";
  } else
  
  // muestra entradadigital IoTControllerAP
  if (id == -11) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("variable")+" ) IoTControllerAP";
  } else
  
  // muestra entradaanalogica IoTControllerAP
  if (id == -12) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("variable")+" ) IoTControllerAP";
  } else
  
  // muestra entradaanalogica IoTControllerAP
  if (id == -13) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("pin")+", "+objeto.get("variable")+" ) IoTControllerAP";
  } else
  
  // muestra tocanota
  if (id==110) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("nota")+" ) ";
  } else
  
  // muestra fondo, colorlinea y relleno
  if (id==98 || id==115 || id==102) {
    if (objeto.isNull("color") == false) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("color")+" ) "; 
    } 
    if (objeto.isNull("colorh") == false) {
      line=""+idiomaactual.get(str(id))+" ( #"+objeto.get("colorh")+" ) ";
    }
    if (objeto.isNull("colorv") == false) {
      line=""+idiomaactual.get(str(id))+" ( "+objeto.get("colorv")+" ) ";
    }   
  } else
  
  // muestra sonido
  if (id==100) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("nombre")+" ) ";
  } else
      
  // muestra linea
  if (id==108) { 
    line=""+idiomaactual.get(str(id));
    if (objeto.isNull("pxt1") == false) line = line+" ( "+objeto.get("pxt1")+" , "; 
    else line = line+" ( "+objeto.get("pxt1v")+" , ";
    if (objeto.isNull("pyt1") == false) line = line+objeto.get("pyt1")+" , "; 
    else line = line+objeto.get("pyt1v")+" , ";
    if (objeto.isNull("pxt2") == false) line = line+objeto.get("pxt2")+" , "; 
    else line = line+objeto.get("pxt2v")+" , ";
    if (objeto.isNull("pyt2") == false) line = line+objeto.get("pyt2")+" ) "; 
    else line = line+objeto.get("pyt2v")+" ) ";
  } else
  
  // muestra triangulo
  if (id==51) { 
    line=""+idiomaactual.get(str(id));
    if (objeto.isNull("pxt1") == false) line = line+" ( "+objeto.get("pxt1")+" , "; 
    else line = line+" ( "+objeto.get("pxt1v")+" , ";
    if (objeto.isNull("pyt1") == false) line = line+objeto.get("pyt1")+" , "; 
    else line = line+objeto.get("pyt1v")+" , ";
    if (objeto.isNull("pxt2") == false) line = line+objeto.get("pxt2")+" , "; 
    else line = line+objeto.get("pxt2v")+" , ";
    if (objeto.isNull("pyt2") == false) line = line+objeto.get("pyt2")+" , "; 
    else line = line+objeto.get("pyt2v")+" , ";
    if (objeto.isNull("pxt3") == false) line = line+objeto.get("pxt3")+" , "; 
    else line = line+objeto.get("pxt3v")+" , ";
    if (objeto.isNull("pyt3") == false) line = line+objeto.get("pyt3")+" ) "; 
    else line = line+objeto.get("pyt3v")+" ) ";
  } else
  
  // muestra asignar
  if (id==61) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
  } else
  
  // muestra sumar
  if (id==62) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
  } else
  
  // muestra restar
  if (id==63) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
  } else
  
  // muestra multiplicar
  if (id==64) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
  } else
  
  // muestra dividir
  if (id==65) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("valor")+" )";
  } else            
  
  // muestra aleatorio
  if (id==97) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("variable")+" , "+objeto.get("vmaximo")+" )";
  } else

  // muestra imagen o video
  if (id==109 || id==118) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("nombre");
    
    if (objeto.isNull("px") == false) line = line+" , "+objeto.get("px")+" , "; 
    else line = line+" , "+objeto.get("pxv")+" , ";
    if (objeto.isNull("py") == false) line = line+objeto.get("py"); 
    else line = line+objeto.get("pyv");
    
    if (objeto.isNull("tx") == true && objeto.isNull("txv") == true)line = line+" )";
    
    if (objeto.isNull("tx") == false) line = line+" , "+objeto.get("tx")+" , ";
    if (objeto.isNull("txv") == false)line = line+" , "+objeto.get("txv")+" , ";
    
    if (objeto.isNull("ty") == false) line = line+objeto.get("ty")+" )"; 
    if (objeto.isNull("tyv") == false) line = line+objeto.get("tyv")+" )";
  } else

  // muestra tamtexto
  if (id==117) {
    line=""+idiomaactual.get(str(id))+" ( "+objeto.get("tamtexto")+" )";
  } else
  
  // muestra texto
  if (id==116) {
    line=""+idiomaactual.get(str(id));
    if (objeto.isNull("texto") == false)line = line+" ( "+objeto.get("texto")+" , ";
    if (objeto.isNull("textov") == false)line = line+" ( "+objeto.get("textov")+" , ";
    if (objeto.isNull("px") == false) line = line+objeto.get("px")+" , "; 
    else line = line+objeto.get("pxv")+" , ";
    if (objeto.isNull("py") == false) line = line+objeto.get("py")+" )"; 
    else line = line+objeto.get("pyv")+" )";
  } else
  
  // muestra rectangulo
  if (id==114 || id==101) {
    line=""+idiomaactual.get(str(id));
    if (objeto.isNull("px") == false) line = line+" ( "+objeto.get("px")+" , "; 
    else line = line+" ( "+objeto.get("pxv")+" , ";
    if (objeto.isNull("py") == false) line = line+objeto.get("py")+" , "; 
    else line = line+objeto.get("pyv")+" , ";
    if (objeto.isNull("tx") == false) line = line+objeto.get("tx")+" , "; 
    else line = line+objeto.get("txv")+" , ";
    //else line = line+idiomagui.getString(objeto.getString("txv"))+" , "; // muestra variable traducida
    if (objeto.isNull("ty") == false) line = line+objeto.get("ty")+" )"; 
    else line = line+objeto.get("tyv")+" )";
  } else
  
  // muestra SI
  if (id==105) {
    line=""+idiomaactual.get(str(id))+" ";

    if (objeto.isNull("valor1") == false) line = line+" ( "+objeto.get("valor1"); 
    else line = line+" ( "+objeto.get("valor1v");
    line = line+" "+objeto.get("condicion")+" ";
    if (objeto.isNull("valor2") == false) line = line+objeto.get("valor2")+" )"; 
    else line = line+objeto.get("valor2v")+" )";
  } else
    
  // muestra PARA
  if (id==111) {
    line=""+idiomaactual.get(str(id))+" ";

    if (objeto.isNull("valorini") == false) line = line+"( desde "+objeto.get("valorini")+" ; "+idiomagui.getString("mientras");
    line = line+" "+idiomagui.getString("ciclo")+" "+objeto.get("condicion")+" "; 
    if (objeto.isNull("valorfinal") == false) line = line+objeto.get("valorfinal")+" ; "; 
    else line = line+objeto.get("valorfinalv")+" ; ";
    line = line+idiomagui.getString("Incremento")+" "+objeto.get("incremento")+" )"; 
  }

  if (objeto.isNull("si") == false)line="    "+line;
  if (objeto.isNull("para") == false)line="    "+line;
  if (objeto.isNull("sino") == false )line="           "+line;
  if (objeto.isNull("encapsulado") == false)line="    "+line;
} // fin leelinea
