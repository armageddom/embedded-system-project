#!/bin/bash
TOPIC="DefaultTopic"
if [[ -n "$1" ]]; then
	TOPIC="$1"
fi
echo "Hello, World" | /home/pi/kafka_2.12-1.0.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $TOPIC > /dev/null
