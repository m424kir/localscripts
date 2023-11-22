@echo off

set ScriptDir="D:\Users\M424\Scripts\EditContextMenu"
set EditorCmd="%APPDATA%\Local\Programs\Microsoft VS Code\Code.exe %1"

cd /d %ScriptDir%

@rem 各ファイルの「編集」用エディタを変更
@rem    - バッチファイル(.bat, .cmd)
if not exist "batfileEditCommand.reg" (
    reg export "HKCR\batfile\shell\edit\command" "batfileEditCommand.reg" /y
    reg add "HKCR\batfile\shell\edit\command" /ve /d %EditorCmd% /f
)
if not exist "cmdfileEditCommand.reg" (
    reg export "HKCR\cmdfile\shell\edit\command" "cmdfileEditCommand.reg" /y
    reg add "HKCR\cmdfile\shell\edit\command" /ve /d %EditorCmd% /f
)
@rem    - レジストリファイル(.reg)
if not exist "regfileEditCommand.reg" (
    reg export "HKCR\regfile\shell\edit\command" "regfileEditCommand.reg" /y
    reg add "HKCR\regfile\shell\edit\command" /ve /d %EditorCmd% /f
)
@rem    - VBScript(.vbs)
if not exist "vbsfileEditCommand.reg" (
    reg export "HKCR\VBSFile\Shell\Edit\Command" "vbsfileEditCommand.reg" /y
    reg add "HKCR\VBSFile\Shell\Edit\Command" /ve /d %EditorCmd% /f
)
