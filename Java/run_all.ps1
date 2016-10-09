& .\reset.ps1
for ($i=1; $i -le 17; $i++){
    write-output "running $i"
	& java -jar ".\tick0-new.jar" ".\testSuite2\test$($i)a.dat" ".\testSuite2\test$($i)b.dat"
}