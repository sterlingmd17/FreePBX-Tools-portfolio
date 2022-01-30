function Add-Extension {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [int]$ExtensionNumber,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$Name,
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string]$Email
    )
    #Make the query and format\escape double " for JSON
    $body = "{""query"": ""mutation { addExtension( input: {extensionId:$ExtensionNumber name:'$Name' email:'$Email' vmEnable: true } ) { status message clientMutationId } }""}"
    $body = $body.Replace("`'", "\`"")
    #Make the request
    Write-Host "Creating the extension $ExtensionNumber..please wait." -ForegroundColor Green
    $result = Invoke-RestMethod -Method "Post" -Uri $script:uri -ContentType "application/json" -Headers $script:Headers -Body $body
    return write-host $result.data.addextension.message -ForegroundColor Green
      
}