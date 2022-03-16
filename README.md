# Window_Manager
## 可変ウィンドウ時の座標計算簡易化クラス

可変ウィンドウ時、図形の座標を対応させる必要がありますが、

仮想ウィンドウ上の座標をx,y関数に通すことで座標を対応させられます

## 動作(gif)
![window](https://user-images.githubusercontent.com/91818705/158534591-432041db-7ee9-4687-83a7-a17a283faf0f.gif)

## Function
- `setWindow(height, width, virtual_height, virtual_width)`初期ウィンドウ,仮想ウィンドウの幅高さを設定
- `x(virtual_x)`仮想ウィンドウx座標からメインウィンドウx座標を取得
- `y(virtual_y)`仮想ウィンドウy座標からメインウィンドウy座標を取得
- `vx(x)`メインウィンドウx座標から仮想ウィンドウx座標を取得
- `vy(y)`メインウィンドウy座標から仮想ウィンドウy座標を取得
- `width(virtual_width)`仮想ウィンドウの幅からメインウィンドウの幅を取得
- `height(virtual_height)`仮想ウィンドウの高さからメインウィンドウの高さを取得
- `getWidth()`仮想ウィンドウの幅をメインウィンドウの幅として取得
- `getheight()`仮想ウィンドウの高さをメインウィンドウの高さとして取得
- `rawWindow()`仮想ウィンドウの位置を表示
