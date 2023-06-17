// Link video https://youtu.be/o7x_7Jr2S3c
// Guerra federico 
// Legajo 91531/6 
float size = 200; 
PImage imagenilu; 

void setup() {
  size(800, 400);
  imagenilu = loadImage("ilusion_optica.jpg");
  
}

void draw() {
  background(255);
  image(imagenilu, width - imagenilu.width, 0); 
  translate(200 - size/2, height/2); 

  drawSquareSequence(size);
  size -= 1; // Disminuir el tamaño de cada cudrado 
  if (size <= 0) {
    size = 300; //reniciar el tamaño al llegar a 0 
  }
}

void drawSquareSequence(float size) {
  float x = 0;
  float y = -size/2;
  for (float s = size; s > 0; s -= 10) {
    rect(x, y, s, s);
    x += 5;
    y += 5; 
  }
}

void mousePressed() {
  if (mouseX < width/2) {
    size = 0; 
  }
}
