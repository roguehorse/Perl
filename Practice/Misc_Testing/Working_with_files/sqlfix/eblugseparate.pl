#!usr/bin/perl

#######################################################
# This program will separate the EBLUG SQL dump users
# table by KEY value producing one file for KEY 1 and
# one file for KEY 2 labeled ebsqlodd.txt and
# ebsqleven.txt respectively.
#
# The separate files can then be run through  
# ebsqlsort.pl to show erroneous entries before 
# being finally repaired by running ebsqlFIX.pl. 
#
# Be sure to read the program notes associated 
# with each of those programs!
# 
# Written by Scott DuBois - July 10, 2014
# Additional help provided by: AppleFritter (PerlMonks)
########################################################

use warnings;
use strict;

my ($ebsql, $fid, $fid1, $fid2, $uid, $uid1, $uid2, $name, $name1, $name2, $FILEREAD, $FILEODD, $FILEEVEN);
my @sqldata;

# Name the SQL dump file to this for reading into the program
my $filedata  = "ebusers.txt";

# The program will generate these files if they do not exist
# OR if they do already exist will overwrite the existing values
my $file_odd  = "+>ebsqlodd.txt";
my $file_even = "+>ebsqleven.txt";

# Open files for reading and writing 
open ($FILEREAD, $filedata)  || die ("Could not open file!");
open ($FILEODD, $file_odd)   || die ("Could not create file!");
open ($FILEEVEN, $file_even) || die ("Could not create file!");

@sqldata = <$FILEREAD>;

# Iterate through each item in the dump file
foreach $ebsql (@sqldata)
 {
   chomp ($ebsql);
   ($fid, $uid, $name) = split (/\s+/, $ebsql);
     # If KEY == 1 print line to ebsqlodd.txt file
     if ($fid == 1) 
       {
         ($fid1, $uid1, $name1) = ($fid, $uid, $name);
         print $FILEODD "$fid1 $uid1 $name1\n";
       } 
     # If KEY == 2 print line to ebsqleven.txt file
     if ($fid == 2)
       {
         ($fid2, $uid2, $name2) = ($fid, $uid, $name);
         print $FILEEVEN "$fid2 $uid2 $name2\n";
       }
 }    

# Close all files
close ($FILEREAD) || die ("Could not close file eblugusers.txt");
close ($FILEODD)  || die ("Could not close file ebsqlodd.txt");
close ($FILEEVEN) || die ("Could not close file ebsqleven.txt");

