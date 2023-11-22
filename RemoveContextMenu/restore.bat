@echo off

@rem スクリプトディレクトリ
cd /d "D:\Users\M424\Scripts\RemoveContextMenu"

@rem 「パスのコピー」(Shift+右クリック)有効化
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPathMenu" /d {f3d06e7c-1e45-4a26-847e-f9fcdee59be0} /f

@rem 「Skypeで共有」有効化
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v {776DBC8D-7347-478C-8D71-791E12EF49D8} /f

@rem 「OneDriveに移動」有効化
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v {CB3D0F55-BC2C-4C1A-85ED-23ED75B5106B} /f

@rem 「共有」復活
if exist "ModernSharing.reg" (
    reg import "ModernSharing.reg"
)

@rem 「スタートメニューにピン留めする」復活
if exist "PintoStartScreen.reg" (
    reg import "PintoStartScreen.reg"
)

@rem 「クイックアクセスにピン留めする」有効化
reg delete "HKCR\Folder\shell\pintohome" /v LegacyDisable /f
@rem reg delete "HKCR\AllFilesystemObjects\shell\pintohome" /v LegacyDisable /f
@rem reg delete "HKCR\Drive\shell\pintohome" /v LegacyDisable /f
@rem reg delete "HKCR\Network\shell\pintohome" /v LegacyDisable /f

@rem 「印刷」有効化
@rem    - テキストファイル(.txt)
reg delete "HKEY_CLASSES_ROOT\txtfile\shell\print" /v LegacyDisable /f
@rem    - 画像ファイル(.jpg, .png, .gif, etc...)
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\print" /v LegacyDisable /f
@rem    - バッチファイル(.bat, .cmd)
reg delete "HKEY_CLASSES_ROOT\batfile\shell\print" /v LegacyDisable /f
reg delete "HKEY_CLASSES_ROOT\cmdfile\shell\print" /v LegacyDisable /f
@rem    - VBScript(.vbs)
reg delete "HKEY_CLASSES_ROOT\VBSFile\Shell\Print" /v LegacyDisable /f
@rem    - 設定ファイル(.ini)
reg delete "HKEY_CLASSES_ROOT\inifile\shell\print" /v LegacyDisable /f
@rem    - レジストリファイル(.reg)
reg delete "HKEY_CLASSES_ROOT\regfile\shell\print" /v LegacyDisable /f
