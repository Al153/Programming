<?php
	$lat = $_GET["lat"];
	$lng = $_GET["lng"];
	$postcode = $_GET["postcode"];

	//writes to txt file read by python

	$file = fopen("APIfile.json","w",);
	fwrite($file, json_encode('["'.$postcode.'""]');
	fclose($file);

	exec("python get_where_can_I_find.py");

	//returns json edited by python

	$wFile = file_get_contents("APIfile.json");
	echo $wFile;


?>