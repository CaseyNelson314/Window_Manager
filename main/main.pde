Window window = new Window();

void setup() {
  window.setWindow(1000, 1000, 1600, 900);
}

void draw() {
  background(255);
  window.drawVirtualWindow();
  rectMode(CENTER);
  rect(window.x(800), window.y(450), window.getWidth()/10, window.getWidth()/10);
}
