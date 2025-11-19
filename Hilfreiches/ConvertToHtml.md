```powershell
$header = "<style>"
$header = $header + "BODY{background-color:peachpuff;}"
$header = $header + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$header = $header + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:thistle}"
$header = $header + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:PaleGoldenrod}"
$header = $header + "</style>"

$HtmlBody = Get-Service | Select-Object -Property Status,Name,DisplayName | ConvertTo-Html -Head $header -Body "<H2>Dienst Infos</H2>" 

#zb. als Email
Send-MailMessage -Body $HtmlBody -BodyAsHtml ...
#oder speichern
$HtmlBody | Out-file -Path ....

```