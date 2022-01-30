get-childitem "$psscriptroot\functions" -fi *.ps1 -ea silentlycontinue | foreach-object { . $_.fullname }

$script:clientid = "<clientID here>"
$script:clientsecret = "<clientsecret here>"
$script:uri = "https://www.yourserver.com:443/admin/api/api/gql"
$script:MyToken = Get-APIToken -clientsecret $script:clientsecret -clientid $script:clientid
$script:Headers = @{Authorization = "Bearer $script:MyToken)"}