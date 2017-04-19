param([String[]] $s, [String] $o)
# Constructs a disk for use by the forth system


function add-file ($s){
    $newPath = Split-Path -parent $s
    try {
        push-location -path $newPath
        $text = ""
        foreach ($fileName in (Get-Content (Split-Path $s -leaf))){
            write-host "filename = $fileName`n"
            if ($fileName -and (-not $filename.StartsWith("#")) ){
                $extn = [IO.Path]::GetExtension($fileName)
                if ($extn -eq ".spec" ){
                    $text = "$text `n`n`n`n$(add-file $fileName)"            
                } else {
                    $text = "$text `n`n`n`n // _________________ $fileName ___________ `n`n $(get-content $fileName | Out-String)"
                }
            }
        }
        return $text
    } finally {
        pop-location
    }
    
}

$text = add-file($s)


$nextBlockNumber = 1
$importBlock = ""
function getImportLine($i){
    "$i 4096 * ADDBLOCK`n"
}


while ("$importBlock $(getImportLine($nextBlockNumber))`n`n $text".length -gt ($nextBlockNumber * 4096)){
    $importBlock = "$importBlock $(getImportLine($nextBlockNumber))"
    $nextBlockNumber = $nextBlockNumber + 1
}
$padString = "// // // // // // // // // // // // // // // // // // // // // //`n"
$text = "$importBlock`n`n $text `n`n`n`n $($padString * 1024)"
$text | Set-Content $o