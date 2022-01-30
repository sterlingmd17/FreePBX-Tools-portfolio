function Get-AllExtensions {
 
  $body = "{""query"": ""query { fetchAllExtensions { status message totalCount extension { extensionId } } } ""}"

  $script:extensions = Invoke-RestMethod -Method "POST" -ContentType "application/json" -Headers $script:Headers -Uri $script:uri -Body $body
  return $script:extensions.data.fetchAllExtensions.extension
}