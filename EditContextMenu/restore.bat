@echo off

@rem スクリプトディレクトリ
cd /d "D:\Users\M424\Scripts\EditContextMenu"

@rem 各ファイルの「編集」用エディタを元に戻す(notepad)
@rem    - バッチファイル(.bat, .cmd)
if exist "batfileEditCommand.reg" (
    reg import "batfileEditCommand.reg"
)
if exist "cmdfileEditCommand.reg" (
    reg import "cmdfileEditCommand.reg"
)
@rem    - レジストリファイル(.reg)
if exist "regfileEditCommand.reg" (
    reg import "regfileEditCommand.reg"
)
@rem    - VBScript(.vbs)
if exist "vbsfileEditCommand.reg" (
    reg import "vbsfileEditCommand.reg"
)
