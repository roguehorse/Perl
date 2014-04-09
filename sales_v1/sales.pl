#!/usr/bin/perl
#Don't forget to run perltidy!
use warnings;
use strict;

my $fixed      = 75000;
my $commission = .07;

print "\n\nThis program calculates the amount of\n";
print "commission eraned based on the amount\n";
print "made in sales.\n\n\n";

sleep 2;

print "Please enter the amount produced in sales: ";
my $sales = <STDIN>;

if ( $sales > $fixed )
{
    $sales = $sales * $commission + $sales;
    print "\n\nThe amount earned including commission: $sales\n\n";
}
else
{
    print "\n\nYou did not produce enough to get a bonus.\n\n";
}

