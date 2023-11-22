# load トースト通知
. "$PSScriptRoot\..\common\Toast.ps1"

# Google IME 辞書ファイル
$from = "${env:USERPROFILE}\AppData\LocalLow\Google\Google Japanese Input\user_dictionary.db"
# バックアップ先
$to = "G:\マイドライブ\ユーザー辞書Backup\"

Copy-Item $from -Destination $to
Toast -title "Google IME" -msg "辞書ファイルをGoogleDriveにバックアップしました"