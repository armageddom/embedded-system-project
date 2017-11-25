#!/bin/bash
TOPIC="DefaultTopic"
if [[ -n "$1" ]]; then
	TOPIC="$1"
fi
/home/pi/kafka_2.12-1.0.0/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic $TOPIC --from-beginning
