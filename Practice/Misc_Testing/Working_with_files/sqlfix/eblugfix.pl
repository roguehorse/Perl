#!usr/bin/perl
use warnings;

my ($ebsql, $even, $odd, $fid, $fid1, $fid2, $uid, $uid1, $uid2, $name, $name1, $name2, $mix);
my @sqldata;
my @ebsql_odd;
my @ebsql_even;

my $filedata  = "sqlbad.txt";
my $file_odd  = "+>ebsqlodd.txt";
my $file_even = "+>ebsqleven.txt";
#my $file_fix  = "+>ebsqlfix.txt";

open (FILEREAD, $filedata)  || die ("Could not open file!");
open (FILEODD, $file_odd)   || die ("Could not create file!");
open (FILEEVEN, $file_even) || die ("Could not create file!");
#open (FILEFIX, $file_fix)   || die ("Could not create file!");

@sqldata = <FILEREAD>;

foreach $ebsql (@sqldata)
 {
   chomp ($ebsql);
   ($fid, $uid, $name) = split (/\s+/, $ebsql);
     if ($fid == 1)
       {
         ($fid1, $uid1, $name1) = ($fid, $uid, $name);
         push (@ebsql_odd, $fid1, $uid1, $name1);
         print FILEODD "$fid1 $uid1 $name1\n";
       } 
     if ($fid == 2)
       {
         ($fid2, $uid2, $name2) = ($fid, $uid, $name);
         push (@ebsql_even, $fid2, $uid2, $name2);
         print FILEEVEN "$fid2 $uid2 $name2\n";
       }
 }    


close (FILEREAD);
close (FILEODD);
close (FILEEVEN);
#close (FILEFIX);

