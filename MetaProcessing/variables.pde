
//---------------------------
//-------- VARIABLES ---------
//---------------------------
class PWindow4 extends PApplet {
  PWindow4() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);

  }
  int y, posy;
  void settings() {
    size(500, 500);
  }

  void setup() {
    surface.setResizable(true); 

    fill(255);
    textSize(18);
    textFont(createFont("Arial Unicode MS",18));
    surface.setTitle(idiomagui.getString("Variables"));
  }

  void draw() {
    background(0);
    posy= mouseY-mouseY % 20;
    y= ((posy-40)/20)+1;
    fill(60);
    if (posy>0 && posy<= 20*(varenterasnom.size()-1))rect(0, posy, width, 20);
    
    for (int i=1; i< varenterasnom.size(); i++) {
      if(i<7)fill(128); else fill(255);
      text(varenterasnom.get(i), 30, 17+(i*20)); // muestra nombres variables
    }
  }

  void mousePressed() {
    nvarselec = y+1;
    varclicked=true;
    
    // boton inicializar bariable
    if(nvarselec>6 && selectvarini==true){
      cargavars = loadJSONArray(sketchfolder+"/"+proyectonombre+"/variables.json"); // acualiza 
      temp = cargavars.getJSONObject(nvarselec-7).getString("valorinicial");
      wininstru = new PWindow3(); 
    }
    
    // boton eliminar variable
    if(eliminavar==true){
      if(nvarselec>6){
        varenterasnom.remove(nvarselec);
        cargavars.remove(nvarselec-7);
        saveJSONArray(cargavars, sketchfolder+"/"+proyectonombre+"/variables.json");
        cargavars = loadJSONArray(sketchfolder+"/"+proyectonombre+"/variables.json");
        }
      eliminavar = false;
      
      }
      
    //exit();
    surface.setVisible(false);
    
  }

  void exit()
  {
    selectvarini = false;
    dispose();
  }

}

void creavariables(){
      varenterasnom.append("paraciclo");
      varenterasnom.append("tecla");
      varenterasnom.append("click");
      varenterasnom.append("ratonX");
      varenterasnom.append("ratonY");
      varenterasnom.append("ancho");
      varenterasnom.append("alto"); 
  

  if(existe == true && existeproyecto == true){    
        for (int i = 0; i < cargavars.size(); i++) {
            JSONObject objeto = cargavars.getJSONObject(i); 
            
            int tipo = objeto.getInt("tipo");
            String nombre = objeto.getString("nombre");
      
            // tipo 0 entera
            if (tipo == 0){
              varenterasnom.append(nombre);
            } else
            // tipo 9 PImage
            if (tipo == 9){
              images.add(loadImage(objeto.getString("nombre")));
            }
        }
  }
}
