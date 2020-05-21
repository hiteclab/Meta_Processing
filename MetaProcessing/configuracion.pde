void configuracion() {
  
  println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
  println("  META_PROCESSING Version Alpha 1.0");
  println("  Developed using Processing 3.4");
  println("  (c) 2020  Jose David Cuartas, GPL v.3\n  Hiteclab, http://hiteclab.libertadores.edu.co/\n  Fundación Universitaria Los Libertadores, Colombia");
  println("  Contact us: hiteclab@libertadores.edu.co");



  codefolder=dataPath("");
  ventatamx = 500;

  String OS = System.getProperty("os.name").toLowerCase(); 
  String[] lista = new String[1];
    
  if( OS.contains("linux") == true || OS.contains("mac") == true){  
    lista = splitTokens(sketchPath(""), "/");
  }
  if( OS.contains("windows") == true){  
    lista = splitTokens(sketchPath(""), "\\");
  }
  int nslash=(lista.length)-1; // determina la cantidad de slash en la ruta
  temp = lista[nslash]; //se guarda el nombre del archivo seleccionado
  String[] lista2 = new String[1];
  if( OS.contains("windows") == true) lista2 = split(sketchPath(""), temp+"\\"); 
  if( OS.contains("linux") == true || OS.contains("mac") == true) lista2 = split(sketchPath(""), temp+"/"); 
  temp = lista2[0]; //se guarda el nombre del archivo seleccionado
  metafolder=temp;
  if( OS.contains("linux") == true || OS.contains("mac") == true)sketchfolder= temp+"Projects/";
  if( OS.contains("windows") == true)sketchfolder= temp+"Projects\\";

  // se carga el ultimo lenguaje seleccionado
  String[] lastlang =loadStrings(codefolder+"/lang/lastlang.txt");
  int lang=int(lastlang[0]);
  inilang(lang);  
  
  iconos = loadImage("BarraOK.png");
  
  // Se revisa si el archivo lastopen.txt existe y se cargan todos los archivos del proyecto
  File archivo = dataFile(sketchfolder+"lastopen.txt");
  String lastopenfile = archivo.getPath();
  existe = archivo.isFile();
  existeproyecto=false;
  
  
  if(existe == true){
  String[] last =loadStrings(sketchfolder+"lastopen.txt");
  proyectonombre= last[0];  
  
  // se revisa si existe el proyecto al que apunta el archivo lastopen.txt
  archivo = dataFile(sketchfolder+"/"+proyectonombre+"/"+proyectonombre+".json");
  lastopenfile = archivo.getPath();
  existeproyecto = archivo.isFile();
  }
  if(existeproyecto == true){
  
        cargacodigo = loadJSONArray(sketchfolder+"/"+proyectonombre+"/"+proyectonombre+".json");
        cargamouse = loadJSONArray(sketchfolder+"/"+proyectonombre+"/"+"raton.json");
        cargateclado = loadJSONArray(sketchfolder+"/"+proyectonombre+"/"+"teclado.json");
      
        configuration = loadJSONArray(sketchfolder+"/"+proyectonombre+"/configuracion.json");
        cargavars = loadJSONArray(sketchfolder+"/"+proyectonombre+"/variables.json");
      
      
      
        if (configuration.getJSONObject(0).getBoolean("pantallacompleta") == false) { 
          fullscreen=false;
        } else fullscreen=true;
      
        // poner en el archivo configuracion.json en la key llamada "cuadros" el volor 0 para tener la velocidad por defecto de processing
        if (configuration.getJSONObject(1).getInt("cuadros")!= 0) frameRate(configuration.getJSONObject(1).getInt("cuadros"));
        if (configuration.getJSONObject(1).getInt("cuadros")!= 0) velocidad= configuration.getJSONObject(1).getInt("cuadros");
        frameRate(velocidad);
    }
  
   else {
  
      JSONObject renuevaobjeto = new JSONObject();
      renuevaobjeto.setInt("id", -1);


      linea=1; 
      tlineas=1;
      lineamouse=1; 
      tlineasmouse=1;
      lineateclado=1; 
      tlineasteclado=1;
      reinicia=true;
      linea = 1;
      lineaanterior=0;
      pausa=false;
      paso=true;
      ejecuta=false; 
      inicio=true;
      runwindow=false;
      codetab=0;
      proyectonombre="meta";
       
      //line="";
      line=""+idiomaactual.get(str(-1));
      idlee=-1;


      cargacodigo = new JSONArray();
      cargamouse = new JSONArray();
      cargateclado = new JSONArray();

      varenterasnom = new StringList();
      creavariables();
      cargacodigo.setJSONObject(0, renuevaobjeto); 
      cargamouse.setJSONObject(0, renuevaobjeto);         
      cargateclado.setJSONObject(0, renuevaobjeto);
    
  }
  



  varenterasval = new IntList();
  varenterasnom = new StringList();

  
  creavariables();
  tlineas = cargacodigo.size(); 
  tlineasmouse = cargamouse.size();
  tlineasteclado = cargateclado.size();
  background(200);
}

// funcion para cargar los archivos de cada idioma
void inilang(int lang){

     // Español
      if (lang==0) {
        idiomagui = loadJSONObject(codefolder+"/lang/Esp/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Esp/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Esp/instrucciones.json");
      }
      // Frances
      if (lang==1) {
        idiomagui = loadJSONObject(codefolder+"/lang/Fr/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Fr/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Fr/instrucciones.json");
      }

      // Hindi
      if (lang==2) {
        idiomagui = loadJSONObject(codefolder+"/lang/Hi/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Hi/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Hi/instrucciones.json");
      }
      // Japones
      if (lang==3) {
        idiomagui = loadJSONObject(codefolder+"/lang/Jp/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Jp/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Jp/instrucciones.json");
      }
      // Italiano
      if (lang==4) {
        idiomagui = loadJSONObject(codefolder+"/lang/Ita/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Ita/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Ita/instrucciones.json");
      }
      // Chino
      if (lang==5) {
        idiomagui = loadJSONObject(codefolder+"/lang/Ch/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Ch/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Ch/instrucciones.json");
      }
      // Portugues
      if (lang==6) {
        idiomagui = loadJSONObject(codefolder+"/lang/Prt/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Prt/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Prt/instrucciones.json");
      }
      // Ingles
      if (lang==7) {
        idiomagui = loadJSONObject(codefolder+"/lang/Eng/gui.json");
        idiomaactual = loadJSONObject(codefolder+"/lang/Eng/instruccioneslist.json");
        prototipoinstru = loadJSONObject(codefolder+"/lang/Eng/instrucciones.json");
      }


}
