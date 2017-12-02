<?php

require("./phpMQTT/phpMQTT.php");

$server = "m14.cloudmqtt.com";
$port = 10326;
$username = "vzcvkuub";
$password = "OhNQpDuxObkA";
$client_id = "phpMQTT-publisher"; // make sure this is unique for connecting to sever - you could use uniqid()

$mqtt = new Bluerhinos\phpMQTT($server, $port, $client_id);

$start = time();
while (1) {
	$temperature = system("perl temperature.pl");
	if ($mqtt->connect(true, NULL, $username, $password)) {
		$mqtt->publish("temperature", "$temperature", 0);
		$mqtt->close();
	} else {
		echo "Time out!\n";
	}
	sleep(1);
}
