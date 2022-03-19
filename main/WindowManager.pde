/*
 *可変ウィンドウ時、座標を使えるように変換するクラス
 *仮想ウィンドウは中央揃え
 */

class Window {
  private float margin = 0;
  private int vWindow_width, vWindow_height; //仮想ウィンドウサイズ
  private int left_x, left_y, right_x, right_y; //仮想ウィンドウ座標

  //初期画面Xピクセル,初期画面Yピクセル,仮想画面Xピクセル,仮想画面Yピクセル
  void window(int pixel_x, int pixel_y, int vPixel_x, int vPixel_y) {
    surface.setResizable(true);
    surface.setSize(pixel_x, pixel_y);
    vWindow_width = vPixel_x;
    vWindow_height = vPixel_y;
  }

  //余白率(百分率)
  void margin(float margin) {
    this.margin = margin/100;
  }


  //仮想ウィンドウでの座標 > 実ウィンドウでの座標
  float x(float point_x) {
    update();
    float vWindowSize = right_x - left_x;
    return left_x + vWindowSize*point_x/vWindow_width;
  }
  float y(float point_y) {
    update();
    float vWindowSize = right_y - left_y;
    return left_y + vWindowSize*point_y/vWindow_height;
  }


  //実ウィンドウでの座標 > 仮想ウィンドウでの座標
  float vx(float point_x) {
    update();
    return (point_x-left_x)*vWindow_width/getWidth();
  }
  float vy(float point_y) {
    update();
    return (point_y-left_y)*vWindow_height/getHeight();
  }


  //仮想ウィンドウでのサイズ > 実ウィンドウでのサイズ
  float width(float _width) {
    update();
    return getWidth() * _width / vWindow_width;
  }
  float height(float _height) {
    update();
    return getHeight() * _height / vWindow_height;
  }


  //仮想ウィンドウサイズ取得(実ウィンドウサイズ)
  float getWidth() {
    update();
    return right_x - left_x;
  }
  float getHeight() {
    update();
    return right_y - left_y;
  }


  void drawWindow() {
    update();
    fill(200);
    noStroke();
    rectMode(CORNERS);
    rect(left_x, left_y, right_x, right_y);
    rectMode(CORNER);
    fill(0);
    textSize(10);
    textAlign(RIGHT, DOWN);
    text("virtual window ("+vWindow_width+"×"+vWindow_height+") margin "+int(margin*100)+"%", right_x-5, right_y-5);
    textAlign(LEFT, DOWN);
  }

  void drawGrid() {
    drawGrid(100, 100);
  }
  void drawGrid(float _width, float _height) {
    stroke(160);
    fill(0);
    textSize(10);
    for (float i=_width; i<vWindow_width; i+=_width) { //縦ライン
      textAlign(CENTER, TOP);
      text((int)i, x(i), left_y);
      line(x(i), left_y+11, x(i), right_y);
    }
    for (float i=_height; i<vWindow_height; i+=_height) { //縦ライン
      textAlign(LEFT, CENTER);
      text((int)i, left_x, y(i));
      line(left_x+26, y(i), right_x, y(i));
    }
    textAlign(LEFT, DOWN);
  }

  //サイズ変更判定
  private int lastWidth, lastHeight;
  private boolean sizeUpdate() {
    boolean isUpdate = false;
    if (lastWidth!=width || lastHeight!=height)isUpdate = true;
    lastWidth = width;
    lastHeight = height;
    return isUpdate;
  }

  //仮想ウィンドウ座標計算
  private void update() {
    if (sizeUpdate()==false)return;
    float widthPerHeight = (float)vWindow_width / vWindow_height;
    float heightPerWidth = (float)vWindow_height / vWindow_width;
    float windowRatio = 1 - margin;
    if (width * heightPerWidth >= height) { //横幅オーバー
      left_x  = int(width/2  - height*widthPerHeight*windowRatio/2);
      right_x = int(width/2  + height*widthPerHeight*windowRatio/2);
      left_y  = int(height/2 - height*windowRatio/2);
      right_y = int(height/2 + height*windowRatio/2);
    } else { //縦幅オーバー
      left_x  = int(width/2  - width*windowRatio/2);
      right_x = int(width/2  + width*windowRatio/2);
      left_y  = int(height/2 - width*heightPerWidth*windowRatio/2);
      right_y = int(height/2 + width*heightPerWidth*windowRatio/2);
    }
  }
};
