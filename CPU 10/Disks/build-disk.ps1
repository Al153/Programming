param([String[]] $s, [String] $o)

$text = ""
foreach ($fileName in (Get-Content $s)){
    $text = "$text `n`n`n`n // _________________ $fileName ___________ `n`n $(get-content $fileName | Out-String)"
}


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