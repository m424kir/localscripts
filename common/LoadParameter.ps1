# script/common/config.iniの定義を読み込む

# load config.ini
$config_file = "config.ini"
$config_fullname = "$PSScriptRoot\$config_file"

# get config.ini define parameter
$Parameter = @{}
Get-Content $config_fullname -Raw | %{ $Parameter += ConvertFrom-StringData $_ }
