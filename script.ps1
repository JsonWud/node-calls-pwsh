[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$MyJsonPayload
)
# Always show this to confirm what we're receiving before conversion
$myTestPattern = [ordered]@{
    prop1 = 'value1'
    prop2 = $MyJsonPayload
    prop3 = @{
        array1 = @('a', 'b', 'c')
    }
}
$testPattern = $myTestPattern | ConvertTo-Json
# Always show this to confirm we can add data and return a new object
$MyInput = $MyJsonPayload | ConvertFrom-Json -AsHashtable
$MyInput['status'] = 'success'
$MyInput['answer'] = 42
$MyInput['errors'] = $null
$addDataToInput = $MyInput | ConvertTo-Json
# Return the array of tests
$testPattern, $addDataToInput