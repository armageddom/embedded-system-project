#!/usr/bin/perl

use strict;
use warnings;

use lib qw/ lib /;

use Kafka qw(
	$BITS64
);
use Kafka::Connection;
use Kafka::Producer;
use TemperatureRead;

my $connection = Kafka::Connection->new( host => 'localhost' );
my $producer   = Kafka::Producer->new( Connection => $connection );

my $tr = TemperatureRead->new();

my $response = $producer->send(
	'DefaultTopic', # topic
	0,              # partition
	$tr->read_temperature()
);

$connection->close();
