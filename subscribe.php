<?php

require("./phpMQTT/phpMQTT.php");

$server = "m14.cloudmqtt.com";
$port = 10326;
$username = "vzcvkuub";
$password = "OhNQpDuxObkA";
$client_id = "phpMQTT-subscriber"; // make sure this is unique for connecting to sever - you could use uniqid()

$mqtt = new Bluerhinos\phpMQTT($server, $port, $client_id);

if(!$mqtt->connect(true, NULL, $username, $password)) {
	exit(1);
}

$topics['test'] = array("qos" => 0, "function" => "procmsg");
$mqtt->subscribe($topics, 0);

while($mqtt->proc()){
		
}


$mqtt->close();

function procmsg($topic, $msg){
	echo "\t$msg\n\n";
}
