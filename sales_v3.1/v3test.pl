#!/usr/bin/perl
#Don't forget to run perltidy!
use warnings;
use strict;

my @z;
my $answer;
my $x = 0;
my $y = 0;

while ($x < 6)
{
print "Please enter a number: ";
$answer = <>;
chomp ($answer);
push (@z, $answer);
$x++;
}

foreach (@z)
{
print "The value in array location $y is $z[$y]";
$y++;
print "\n";
}

