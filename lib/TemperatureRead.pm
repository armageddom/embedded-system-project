package TemperatureRead;

use strict;
use warnings;
use autodie;

sub new {
	bless {}, shift;
}

sub read_temperature {
	my $filepath = '/sys/bus/w1/devices/28-00000829948a/w1_slave';

	print "Device output file not defined" if ! defined $filepath;
	print "Device output file not found in path '$filepath'" if ! -f $filepath;

	open my $fh, '<', $filepath;

	my @lines;
	push @lines, $_ while <$fh>;

	close $fh;

	$lines[1] =~ /t=(\d+)/;
	substr($1, 0, 2) . '.' . substr($1, 2);
}

1;
