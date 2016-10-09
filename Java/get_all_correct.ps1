Robocopy.exe '.\testSuite2 - Copy' '.\testSuite2 - Correct'
for ($i=1; $i -le 17; $i++){
    write-output "running $i"
    & java -jar ".\at736-tick0.jar" ".\testSuite2 - Correct\test$($i)a.dat" ".\testSuite2 - Correct\test$($i)b.dat"
}