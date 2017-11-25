#!/usr/bin/perl

use strict;
use warnings;

use Kafka qw(
	$BITS64
);
use Kafka::Connection;
use Kafka::Producer;

my $connection = Kafka::Connection->new( host => 'localhost' );
my $producer   = Kafka::Producer->new( Connection => $connection );

my $response = $producer->send(
	'DefaultTopic', # topic
	0,              # partition
	'Hello, Kafka!' # message
);

$connection->close();
