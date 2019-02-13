function Get-VSTeamDescriptor {
   [CmdletBinding(DefaultParameterSetName = 'ByStorageKey')]
   param(
      [Parameter(ParameterSetName = 'ByStorageKey', Mandatory = $true)]
      [string] $StorageKey
   )

   process {
      # Call the REST API
      $resp = _callAPI -Area 'graph' -Resource 'descriptors' -id $StorageKey `
         -Version $([VSTeamVersions]::Graph) `
         -SubDomain 'vssps'

      # Storing the object before you return it cleaned up the pipeline.
      # When I just write the object from the constructor each property
      # seemed to be written
      $descriptor = [VSTeamDescriptor]::new($resp)

      Write-Output $descriptor
   }
}