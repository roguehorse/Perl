#!usr/bin/perl

##########################################################
# This program should be run AFTER the main dump file has
# been cleaned already by running ebsqlsort.pl as many
# times as necessary. Once the file has been cleaned, run
# eblugseparate.pl and then this program to remove any
# entries where KEY 1 line NAME == KEY 2 line NAME. This
# program will compare the name values in column 3 
# line-by-line from ebsqlodd.txt and ebsqleven.txt 
# produced from running eblugseparate.pl.                            
#                                                        
# Written by Scott DuBois - July 10, 2014                
# Additional help provided by: AppleFritter (PerlMonks)  
########################################################## 

use warnings;
use strict;

my ($ODD, $EVEN, $FIX);

# Files being read should have equal 1-to-1 values
my $file1 = 'ebsqlodd.txt';
my $file2 = 'ebsqleven.txt';

# This will be the FINAL output file good for SQL insertion
my $file3 = '+>ebsql_FIX.txt';

# Open all files 
open ($ODD, $file1)  || die ("Could not open file!");
open ($EVEN, $file2) || die ("Could not open file!");
open ($FIX, $file3)  || die ("Could not open file!");

# Uses ebsqlodd.txt for loop iterations
while (my $line1 = <$ODD>)
 {
   my $line2 = <$EVEN>;

   chomp ($line1, $line2);
 
   # Separate line values into individual parts
   my ($key1, $num1, $str1) = split (/\s+/, $line1);
   my ($key2, $num2, $str2) = split (/\s+/, $line2);

   # If NAME value of ebsqlodd.txt is NOT EQUAL to
   # NAME value of ebsqleven.txt then print line
   # from each to ebsql_FIX.txt
   if ($str1 ne $str2)
     {
        print $FIX "$line1\n";
        print $FIX "$line2\n";
     }	
 }

# Close all files
close ($ODD)  || die ("Could not close file ebsqlodd.txt!");
close ($EVEN) || die ("Could not close file ebsqleven.txt!");
close ($FIX)  || die ("Could not close file ebsql_mix.txt!");


