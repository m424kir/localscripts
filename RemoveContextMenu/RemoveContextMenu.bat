@echo off

set ScriptDir="D:\Users\M424\Scripts\RemoveContextMenu"

@rem スクリプトディレクトリ
cd /d %ScriptDir%

@rem 「パスのコピー」(Shift+右クリック)無効化 - Path Copy Copyを使用するため
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPathMenu" /d ;{f3d06e7c-1e45-4a26-847e-f9fcdee59be0} /f

@rem 「Skypeで共有」無効化
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v {776DBC8D-7347-478C-8D71-791E12EF49D8} /f

@rem 「OneDriveに移動」無効化
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v {CB3D0F55-BC2C-4C1A-85ED-23ED75B5106B} /f

@rem 「共有」削除
if not exist "ModernSharing.reg" (
    reg export "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" "ModernSharing.reg" /y
    reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f
)

@rem 「スタートメニューにピン留めする」削除
if not exist "PintoStartScreen.reg" (
    reg export "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" "PintoStartScreen.reg" /y
    reg delete "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
)

@rem 「クイックアクセスにピン留めする」無効化
reg add "HKCR\Folder\shell\pintohome" /v LegacyDisable /f
@rem 以下はWin11用
@rem reg add "HKCR\AllFilesystemObjects\shell\pintohome" /v LegacyDisable /f
@rem reg add "HKCR\Drive\shell\pintohome" /v LegacyDisable /f
@rem reg add "HKCR\Network\shell\pintohome" /v LegacyDisable /f

@rem 「印刷」無効化
@rem    - テキストファイル(.txt)
reg add "HKEY_CLASSES_ROOT\txtfile\shell\print" /v LegacyDisable /f
@rem    - 画像ファイル(.jpg, .png, .gif, etc...)
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\print" /v LegacyDisable /f
@rem    - バッチファイル(.bat, .cmd)
reg add "HKEY_CLASSES_ROOT\batfile\shell\print" /v LegacyDisable /f
reg add "HKEY_CLASSES_ROOT\cmdfile\shell\print" /v LegacyDisable /f
@rem    - VBScript(.vbs)
reg add "HKEY_CLASSES_ROOT\VBSFile\Shell\Print" /v LegacyDisable /f
@rem    - 設定ファイル(.ini)
reg add "HKEY_CLASSES_ROOT\inifile\shell\print" /v LegacyDisable /f
@rem    - レジストリファイル(.reg)
reg add "HKEY_CLASSES_ROOT\regfile\shell\print" /v LegacyDisable /f
