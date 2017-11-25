#!/bin/bash
nohup /home/pi/kafka_2.12-1.0.0/bin/kafka-server-start.sh /home/pi/kafka_2.12-1.0.0/config/server.properties > /home/pi/kafka.log 2>&1 &
