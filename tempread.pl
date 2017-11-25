#!/usr/bin/perl

use strict;
use warnings;
use autodie;

my $device_output = '/sys/bus/w1/devices/28-00000829948a/w1_slave';

sub read_temperature {
	my $filepath = shift;
	print "Device output file not defined" if ! defined $filepath;
	print "Device output file not found in path '$filepath'" if ! -f $filepath;

	open my $fh, '<', $filepath;

	my @lines;
	push @lines, $_ while <$fh>;

	close $fh;

	$lines[1] =~ /t=(\d+)/;
	my $temperature = substr($1, 0, 2) . '.' . substr($1, 2);
}

use Data::Dumper;
print Dumper(read_temperature($device_output));
