#!usr/bin/perl
#starter<rename>!
use warnings;
use strict;

my $opt1 = "Hello";
my $opt2 = "Goodbye";

print "Are you coming or going?  ";
my $select = <>;
chomp($select);
    if ($select eq 'coming')
      {
          print "If that's the case then '$opt1'\n";
      }
      else 
      {
          print "I'm sorry to here that; '$opt2'\n";
      }

        
     


