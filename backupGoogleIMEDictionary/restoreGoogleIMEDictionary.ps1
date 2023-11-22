# load トースト通知
. "$PSScriptRoot\..\common\Toast.ps1"

# バックアップ先
$from = "G:\マイドライブ\ユーザー辞書Backup\user_dictionary.db"
# Google IME 辞書ファイル
$to = "${env:USERPROFILE}\AppData\LocalLow\Google\Google Japanese Input\"

# リストア
Copy-Item $from -Destination $to

# Google IME 辞書を開き、更新する
$googleime = "${env:ProgramFiles(x86)}\Google\Google Japanese Input\GoogleIMEJaTool.exe"
start -FilePath $googleime -ArgumentList "--mode=dictionary_tool"

Toast -title "Google IME" -msg "辞書ファイルをGoogleDriveからリストアしました"