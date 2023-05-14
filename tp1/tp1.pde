// tp1
// Guerra Federico --> legajo 91531/6
// Comisión 3
PFont font;
int PantallaActual = 1;
int Tiempo = 0;
int DuracionPantalla = 5000; 
PImage imagen1, imagen2, imagen3;
boolean MostrarBotonReset = false;
float scaleFactor = 1.0;
int xPos = 0;  // Posición horizontal del texto
void setup() {
  size(640, 480);
  font = createFont("fuente", 32);
  textAlign(CENTER, CENTER);
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  textAlign(CENTER, CENTER);
  textSize(32);
}

void draw() {
  switch(PantallaActual) {
  case 1:
    Pantalla1();
    break;
  case 2:
    Pantalla2();
    break;
  case 3:
    Pantalla3();
    break;
  }

  if (millis() - Tiempo > DuracionPantalla) {
    PantallaActual++;
    if (PantallaActual > 3) {
      PantallaActual = 3;
      MostrarBotonReset = true;
    }
    Tiempo = millis();
  }
}

void Pantalla1() {
  background(255);
  image(imagen1, 0, 0, width, height);
  fill(0);
  textFont(font);
  textSize(32);
  scale(1, map(cos(frameCount*0.01), -1, 1, 0.5, 2));
  fill(244, 244, 244);
  text("Rodney Pike", 320, 240);
}

void Pantalla2() {
  background(255);
  image(imagen2, 0, 0, 320, height);
  fill(0);
  textFont(font);
  textSize(18);
  scale(scaleFactor);
  scaleFactor += 0.001;
  if (scaleFactor >= 2.0) {
    scaleFactor = 1.0;
  }
  fill(0);
  text("Ilustrador digital", 400, height/2);
}

void Pantalla3() {
  background(255);
  image(imagen3, 0, 0, width, height);
  fill(244, 244, 244);


  if (MostrarBotonReset) {
    fill(0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height-50, 200, 50);
    fill(244, 244, 244);
    textSize(24);
    text("Reiniciar", width/2, height-50);

    xPos++;

    if (xPos > width + 100) {
      xPos = -100;
    }

    fill(244, 244, 244);
    text("sus modelos son personajes de la vida púbica", xPos, height/2);
  }
}

void mouseClicked() {
  if (MostrarBotonReset && mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height-75 && mouseY < height-25) {
    PantallaActual = 1;
    Tiempo = millis();
    MostrarBotonReset = false;
  }
}
