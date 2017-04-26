val json4sNative = "org.json4s" %% "json4s-native" % "3.5.0"

val dummy = ""



name := "SlangSBT"

version := "1.0"

scalaVersion := "2.11.7"

libraryDependencies ++= Seq("com.typesafe.play" % "play-json_2.11" % "2.4.2", json4sNative)

libraryDependencies += "org.rogach" %% "scallop" % "2.1.1"
