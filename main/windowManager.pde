/*
 *可変ウィンドウ時、座標を使えるように変換するクラス
 *仮想ウィンドウは中央揃え
 */

class Window {
  private int vWindow_x, vWindow_y; //仮想ウィンドウサイズ
  private float left_x, left_y, right_x, right_y; //仮想ウィンドウ座標
  
  private float widthPerHeight, heightPerWidth;

  private void updatePoint() {
    if (width * heightPerWidth >= height) { //横幅オーバー
      left_x = width/2 - height*widthPerHeight/2;
      left_y = 0;
      right_x = width/2 + height*widthPerHeight/2;
      right_y = height;
    } else { //縦幅オーバー
      left_x = 0;
      left_y = height/2 - width*heightPerWidth/2;
      right_x = width;
      right_y = height/2 + width*heightPerWidth/2;
    }
  }

  //初期画面Xピクセル,初期画面Yピクセル,仮想画面Xピクセル,仮想画面Yピクセル
  void setWindow(int pixel_x, int pixel_y, int vPixel_x, int vPixel_y) {
    surface.setResizable(true);
    surface.setSize(pixel_x, pixel_y);
    widthPerHeight = (float)vPixel_x / vPixel_y;
    heightPerWidth = (float)vPixel_y / vPixel_x;
    vWindow_x = vPixel_x;
    vWindow_y = vPixel_y;
  }

  //仮想ウィンドウ内座標 戻り値:実ウィンドウ座標
  float x(float pixel_x) {
    updatePoint();
    float vWindowSize = right_x-left_x;
    return left_x + vWindowSize/vWindow_x*pixel_x;
  }
  float y(float pixel_y) {
    updatePoint();
    float vWindowSize = right_y-left_y;
    return left_y + vWindowSize/vWindow_y*pixel_y;
  }
  
  //戻り値:仮想ウィンドウのサイズ(実ウィンドウpx)
  float getWidth(){
    return right_x - left_x;
  }
  float getHeight(){
    return right_y - left_y;
  }

  //実ウィンドウ座標 戻り値:仮想ウィンドウ内座標
  //float vx(float pixel_x){
  //}
  //float vy(float pixel_y){
  //}


  void drawVirtualWindow() {
    updatePoint();
    fill(200);
    noStroke();
    rectMode(CORNERS);
    rect(left_x, left_y, right_x, right_y);
    fill(0);
    textSize(10);
    textAlign(LEFT, TOP);
    text("virtual window ("+vWindow_x+"×"+vWindow_y+")", left_x, left_y);
  }
};
