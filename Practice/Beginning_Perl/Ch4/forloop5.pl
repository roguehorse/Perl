#!usr/bin/perl
use warnings;
use strict;

my @array = (1..10);
foreach (@array)
{
  $_++;
}

print "Array is now: @array\n";
