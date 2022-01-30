function Get-APIToken{
    param(
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$clientid,
    [Parameter(Mandatory = $true, ValueFromPipeline= $true)]
    [string]$clientsecret
    )
    if (!$script:MyToken){
        $Tokenresponse = Invoke-WebRequest -Uri "https:/www.yourserver.com:443/admin/api/api/token" -Method POST -Body ("grant_type=client_credentials&client_id=$($clientid)+&client_secret=$($clientsecret)&scope=gql") | ConvertFrom-Json | Select-Object access_token
        return $script:MyToken=$Tokenresponse.access_token
    }
    else{
        return $script:MyToken
    }
  }