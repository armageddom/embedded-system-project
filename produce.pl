#!/usr/bin/perl

use strict;
use warnings;

use lib qw/ lib /;

use TemperatureRead;
my $tr = TemperatureRead->new();
print($tr->read_temperature()."\n");
