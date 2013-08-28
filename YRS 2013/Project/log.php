<?php
	//gets inputs
	$nickname = $_GET["nickname"];
	$animal = $_GET["animal"];
	$msg = $_GET["msg"];
	$postcode = $_GET["postcode"]

	//turns vars into array for use with json and python
	$array = array($animal, $postcode, $msg, $nickname)

	$file = fopen("APIfile.json","w",);
	fwrite($file, json_encode($array));
	fclose($file);

	//runs python
	exec ("python submit_a_report.py");

?>