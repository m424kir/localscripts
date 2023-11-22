
# Windows10 トースト通知
function global:Toast {
    param ([Parameter(Mandatory)][String] $title,[Parameter(Mandatory)][String] $msg,[String] $picturePath,[String] $bigPicturePath )
    if($picturePath -ne "") {$p1=Resolve-Path $picturePath;}
    if($bigPicturePath -ne "") {$p2=Resolve-Path $bigPicturePath;}
    $AppId = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe";
    $template = @"
<toast><visual><binding template="ToastGeneric"><text>$($title)</text><text>$($msg)</text>
<image placement="appLogoOverride" hint-crop="circle" src="$($p1)"/><image src="$($p2)"/>
</binding></visual></toast>
"@;
    [void][Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime];
    $xml=new-object Windows.Data.Xml.Dom.XmlDocument;
    $xml.loadXml($template);
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]::CreateToastNotifier($AppId).Show($xml);
}
