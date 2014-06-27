#!/usr/bin/perl
use warnings;
use strict;
#Ch3 arraylen.plx

my @array1;
my $scalar1; 
@array1 = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
$scalar1 = @array1;

print "Array 1 is @array1\n Scalar 1 is $scalar1\n";

my @array2;
my $scalar2;
@array2 = qw(Winter Spring Summer Autumn);
$scalar2 = @array2;

print "Array 2 is @array2\n Scalar 2 is $scalar2\n";
	
print "\n";
