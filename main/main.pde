final int WINDOW_WIDTH = 1000;
final int WINDOW_HEIGHT = 1000;

final int VIRTUR_WINDOW_WIDTH = 400;
final int VIRTUR_WINDOW_HEIGHT = 300;


Window window = new Window();

void setup() {
  //初期サイズ、仮想ウィンドウサイズを設定
  window.setWindow(WINDOW_WIDTH, WINDOW_HEIGHT, VIRTUR_WINDOW_WIDTH, VIRTUR_WINDOW_HEIGHT);
}

void draw() {
  background(255);
  
  //仮想ウィンドウを表示
  window.drawWindow();
  
  //四角形をウィンドウの中心に表示
  fill(100);
  rectMode(CENTER);
  rect(window.x(200), window.y(150), window.width(100), window.height(75));
}
