<#
.SYNOPSIS
 Kurzbeschreibung des Skriptes
.DESCRIPTION
 Lange Beschreibung des Skriptes
.PARAMETER EventId
 Folgende Werte sind möglich:
 4624 Anmeldung
 4625 fehlgeschlagene Anmeldung
 4634 Abmeldung
.EXAMPLE 
 Get-eventlog.ps1 -EventId 4634

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  883161 Nov 19 14:51  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883158 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883157 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883156 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883153 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
.EXAMPLE 
 Get-eventlog.ps1 -EventId 4634 -Verbose
AUSFÜHRLICH: Vom User angegeben: 4634 | 5 | localhost

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  883161 Nov 19 14:51  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883158 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883157 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883156 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  883153 Nov 19 14:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$Computername = "localhost"

)
# Kommentar innerhalb der Zeile kann auch nach einem cmdlet Kommen

<#   
 Kommentarbereich definieren
#>
Write-Verbose -Message "Vom User angegeben: $EventId | $Newest | $Computername "

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest
