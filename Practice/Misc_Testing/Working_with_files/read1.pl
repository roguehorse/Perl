#!usr/bin/perl
use warnings;
use strict;

my ($wrestler, $w_name, $crowd_re, $fav_movie);
my @raw_data;

my $data_file = "test.txt";
open (FILE, $data_file) || die ("Could not open file!");
@raw_data = <FILE>;

foreach $wrestler (@raw_data)
  {
    chomp ($wrestler);
    ($w_name, $crowd_re, $fav_movie) = split (/,/, $wrestler);
    print "When $w_name is in the ring, the crowd will $crowd_re when the $fav_movie is played.\n";
  }

close(FILE);


