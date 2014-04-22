#!/usr/bin/perl
# Don't forget to run perltidy!

use warnings;
use strict;
use Term::ANSIColor;

#***************************************
# Written by Scott DuBois              *
# 4/19/2014 			       *
#				       *
# Program written in perl specifically *
# for the purpose of the week 1 CSS218 *
# individual assignment.               *
#				       *
#***************************************

my $name;
my $class = 'CSS218';

system ('clear');

print "What is your name? ";
print color 'bright_yellow';
$name = <>;
chomp ($name);
print color 'reset';
sleep 2;
print "\n\n\nWelcome to ";
print color 'bright_magenta';
print "$class ";
print color 'bright_yellow';
print "$name";
print color 'reset';
print " ! ";

print "\n\n\n\n";


