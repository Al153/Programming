<?php
	$postcode = $_GET["postcode"];
	//$postcode = "OX15DL";
	$url = "http://uk-postcodes.com/postcode/" . $postcode . ".json";
	echo file_get_contents($url);
?>