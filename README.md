# Window_Manager
## 可変ウィンドウ時の座標計算簡易化クラス

可変ウィンドウ時、図形の座標対応させる必要がありますが、

仮想ウィンドウ上の不変座標をx,y関数に通すことで座標を対応させられます

![window](https://user-images.githubusercontent.com/91818705/158534591-432041db-7ee9-4687-83a7-a17a283faf0f.gif)

- `setWindow(height, width, virtual_height, virtual_width)`初期ウィンドウ,仮想ウィンドウの幅高さを設定
- `x(virtual_x), y(virtual_y)`仮想ウィンドウ上座標からメインウィンドウ上座標を取得
- `getWidth()`仮想ウィンドウの幅を取得
- `getheight()`仮想ウィンドウの高さを取得
