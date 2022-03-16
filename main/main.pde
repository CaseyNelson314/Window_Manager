final int WINDOW_WIDTH = 1000;
final int WINDOW_HEIGHT = 1000;

final int VIRTUR_WINDOW_WIDTH = 400;
final int VIRTUR_WINDOW_HEIGHT = 300;


Window window = new Window();

void setup() {
  frameRate(120);
  window.setWindow(WINDOW_WIDTH, WINDOW_HEIGHT, VIRTUR_WINDOW_WIDTH, VIRTUR_WINDOW_HEIGHT);
}

void draw() {
  //println((int)frameRate);
  background(255);
  window.drawWindow();
  fill(100);
  rectMode(CENTER);
  rect(window.x(200), window.y(150), window.width(100), window.height(75));
  println(window.x(window.vx(100)));
}
