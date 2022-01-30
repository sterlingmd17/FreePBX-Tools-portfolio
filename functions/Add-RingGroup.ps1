function Add-RingGroup {
  param(
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)][Alias("RingGroup", "RingGroupID")]
    [int]$GroupNumber,
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$Description,
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [ValidateSet("ringall", "hunt", "memoryhunt", "firstavailable", "firstnotonphone", "random")]$RingStrategy,
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string[]]$Extensions
  )
  $ExtensionsFormatted = $Extensions -join "-"
  $body ="{""query"": ""mutation { addRingGroup(input: { groupNumber: $GroupNumber description:'$Description' strategy:'$RingStrategy' extensionList:'$ExtensionsFormatted' } ) {message status}}""}"
  $body = $body.Replace("`'", "\`"")

  Write-Host "Creating $Description,$GroupNumber...please wait." -ForegroundColor Green
  $result = Invoke-RestMethod -Method "Post" -Uri $script:uri -ContentType "application/json" -Headers $script:Headers -Body $body
  return Write-Host $result.data.addRingGroup.message -ForegroundColor Green

}