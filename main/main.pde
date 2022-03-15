final int WINDOW_WIDTH = 1000;
final int WINDOW_HEIGHT = 1000;

final int VIRTUR_WINDOW_WIDTH = 1600;
final int VIRTUR_WINDOW_HEIGHT = 900;


Window window = new Window();

void setup() {
  window.setWindow(WINDOW_WIDTH, WINDOW_HEIGHT, VIRTUR_WINDOW_WIDTH, VIRTUR_WINDOW_HEIGHT);
}

void draw() {
  background(255);
  window.drawVirtualWindow();
  rectMode(CENTER);
  rect(window.x(800), window.y(450), window.getWidth()/10, window.getWidth()/10);
}
