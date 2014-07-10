#!usr/bin/perl
use warnings;

$file1 = 'ebsqlodd.txt';
$file2 = 'ebsqleven.txt';

open (ODD, $file1) || die ("Could not open file!");
open (EVEN, $file2) || die ("Could not open file!");

@odd = <ODD>;
@even = <EVEN>;

my @odd2;

foreach $odd (@odd)
 {
   chomp ($odd);
   my ($o1, $o2, $o3) = split (/\s+/, $odd);
   push (@odd2, $o1, $o2, $o3);
 }  

my @even2;

foreach $even (@even)
 {
   chomp ($even);
   my ($e1, $e2, $e3) = split (/\s+/, $even);
   push (@even2, $e1, $e2, $e3);
 }


close (ODD);
close (EVEN);


