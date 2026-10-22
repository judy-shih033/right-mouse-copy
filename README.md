# right-mouse-copy

用滑鼠右鍵快速複製、貼上文字的 Windows 小工具，以 [AutoHotkey v2](https://www.autohotkey.com/) 撰寫。

選取文字後：

| 操作 | 效果 |
|---|---|
| 按住右鍵拖到目的地放開 | 複製並貼到放開的位置 |
| 快速連按兩下右鍵 | 複製（等同 Ctrl+C） |
| 右鍵點一下 | 正常的右鍵選單 |

拖曳貼上完成後會還原剪貼簿，不會蓋掉你原本複製的內容。

## 系統需求

- Windows 10 / 11
- AutoHotkey v2.0 以上

## 安裝

### 方法一：安裝版

1. 到 [autohotkey.com](https://www.autohotkey.com/) 下載並安裝 **v2.0**。
2. 下載本專案的 `right-mouse-copy.ahk`，放到固定的資料夾，例如 `C:\Tools\`。
3. 對檔案點兩下執行，右下角系統匣出現綠色 **H** 圖示即代表已啟動。

### 方法二：免安裝版

若安裝程式出現找不到 `Temp` 路徑之類的錯誤，可改用免安裝版：

1. 下載 AutoHotkey v2 的 **.zip** 版本，解壓到例如 `C:\Tools\AutoHotkey\`。
2. 把 `right-mouse-copy.ahk` 拖到 `AutoHotkey64.exe` 上放開即可執行。

## 開機自動執行

1. 按 `Win + R`，輸入 `shell:startup` 開啟「啟動」資料夾。
2. 在裡面建立 `right-mouse-copy.ahk` 的捷徑。
   - 免安裝版的捷徑目標請填：
     ```
     "C:\Tools\AutoHotkey\AutoHotkey64.exe" "C:\Tools\right-mouse-copy.ahk"
     ```
3. 之後每次登入都會自動在背景執行。

不想用時，刪掉「啟動」資料夾裡的捷徑即可。

## 設定

用文字編輯器打開 `right-mouse-copy.ahk`，修改檔案上方的數值：

| 參數 | 預設 | 說明 |
|---|---|---|
| `MIN_DRAG` | `10` | 右鍵移動超過幾像素才算拖曳 |
| `DOUBLE_MS` | `300` | 兩次右鍵間隔在幾毫秒內算「連按兩下」 |

存檔後，對系統匣的 H 圖示按右鍵 →「Reload Script」即可套用。

## 停止與暫停

- `Ctrl + Alt + Q`：結束腳本
- 系統匣 H 圖示右鍵 →「Suspend Hotkeys」：暫停；「Exit」：結束

## 已知限制

- 只處理**文字**，圖片不會被複製貼上。
- 單按右鍵時，選單會延遲約 0.3 秒出現（要判斷是否有第二下）。
- 原生的「右鍵拖曳」會被取代，例如檔案總管右鍵拖曳檔案時的複製／移動選單。
- 沒有選取文字時，部分編輯器（如 VS Code）按 Ctrl+C 會複製整行。
- 目標程式若以系統管理員身分執行，腳本也需以系統管理員身分執行才有效。
- 一次只能執行一個本專案的腳本，同時執行多個會互相搶右鍵。

## 其他版本

[`extras/`](extras/) 資料夾裡有單一功能的版本：

| 檔案 | 功能 |
|---|---|
| `right-drag-copy.ahk` | 只有右鍵拖曳複製貼上 |
| `double-right-copy.ahk` | 只有連按兩下右鍵複製 |
| `chord-drag-copy.ahk` | 左右鍵**同時按住**拖曳複製貼上（單按左右鍵都會延遲約 80 毫秒） |

## 授權

[MIT License](LICENSE)
