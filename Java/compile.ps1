get-childitem .\uk\ac\cam\at736\fjava\tick0 -include *.class | foreach ($_) {remove-item $_.fullname}

javac .\uk\ac\cam\at736\fjava\tick0\ExternalSort.java
jar -cfe .\tick0-new.jar uk.ac.cam.at736.fjava.tick0.ExternalSort uk\ac\cam\at736\fjava\tick0\*