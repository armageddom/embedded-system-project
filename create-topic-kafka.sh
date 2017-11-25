#!/bin/bash
TOPIC="DefaultTopic"
if [[ -n "$1" ]]; then
	TOPIC="$1"
fi
/home/pi/kafka_2.12-1.0.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic $TOPIC
