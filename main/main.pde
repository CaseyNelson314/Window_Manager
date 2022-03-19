final int WINDOW_WIDTH = 700;
final int WINDOW_HEIGHT = 700;

final int VIRTUR_WINDOW_WIDTH = 1000;
final int VIRTUR_WINDOW_HEIGHT = 1000;

Window window =new Window();

void setup() {
  //初期サイズ、仮想ウィンドウサイズを設定
  window.window(WINDOW_WIDTH, WINDOW_HEIGHT, VIRTUR_WINDOW_WIDTH, VIRTUR_WINDOW_HEIGHT);
  
  //仮想ウィンドウの余白率を設定(百分率)
  //window.margin(10);
}

void draw() {
  background(255);
  //仮想ウィンドウを描画
  window.drawWindow();
  
  //罫線を描画
  window.drawGrid(100, 100);
  
  //四角形を描画
  fill(100);
  rectMode(CENTER);
  rect(window.x(200), window.y(300), window.width(100), window.height(75));
}
