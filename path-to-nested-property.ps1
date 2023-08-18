$hash1 = @{
    Path = @{
        To = @{
            Nested = @{
                Property = 'Value'
            }
        }
    }
}

$PTNP = 'Path.To.Nested.Property'

function Get-NestedHashValue {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$Hash,
        [Parameter(Mandatory = $true)]
        [string]$PropertyPath

    )
    begin {}
    process {
        $PTNParray = $PropertyPath -split '\.'
        $keyString = $PTNParray | ForEach-Object { "['$_']" }
        $finalPath = $keyString -join ''
        try {
            $answer = Invoke-Expression ('${0}{1}' -f 'hash1', $finalPath)
        }
        catch {
            Write-Error "Failed to invoke expression: $_"
        }
        
        $answer
    }
    end {}
}



$myValue = Get-NestedHashValue -Hash $hash1 -PropertyPath 'Path.To.Nested.Property.Bogus'
