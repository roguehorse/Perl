#!/usr/bin/perl
#Don't forget to run perltidy
use warnings;
use strict;
use Term::ANSIColor;

#############################################################
# Converted to Perl by Scott DuBois - 4/14/2014             #
#                                                           #
# Original Algorithm                                        #
#							    #
# Part 1						    #
# Design, implement, test, and debug a program with a       #
# JFrame that allows the user to enter a series of contacts'#
# names, ages, e-mail address, and cell phone numbers, and  #
# and creates a file from the enetered data.                #
# 							    #
# Validate the age entry to insure that it is numeric and   #
# between 0 and 120. Include information for three to five  #
# contacts.						    #
#							    #
# Part 2						    #
# Design, implement, test, and debug a program that reads   #
# the file you created by the list in part 1 and displays   #
# the records in a JFrame. You may either display all       #
# entries in the list at once or display them one at a time;#
# the user interface is up to you.			    #
# Protect against not being able to open the file.          #
#							    #
# Original program written in Java by Scott DuBois on       #
# 10/28/2013						    #
#############################################################

my ($fname, $lname, $age, $mail, $cell);
my $option;

system ("clear");
print "This progarm was written as a contact information database\n\n";
print "The user will be asked if they wish to view their saved data\n";
print "or enter data from a new contact.\n\n";
sleep 1;
print "If entering new contact information, the first name,\n";
print "last name, age, e-mail and address will be collected then\n";
print "Then the user will be asked if the information correct\n";
print "before saving the information.\n\n\n\n";

print "Please enter your selection: [R]Read or [I]Input: ";
$option = <>;
chomp ($option);

if ($option =~ '/I/gi' || $option =~ '/Input/gi')
	{
	    print "\n\n";
	    print color 'bright_cyan';
	    print "Please input the first name: ";
	    print color 'bright_yellow';
	    $fname = <>;
	    chomp ($fname);
	    print "\n";
	    print color 'bright_cyan';
	    print "Please input the last name: ";
	    print color 'bright_yellow';
	    $lname = <>;
	    chomp ($lname);
	    print "\n";
	    print color 'bright_cyan';
	    print "Please input the age: ";
	    print color 'bright_yellow';
	    $age = <>;
	    chomp ($age);
	    print "\n";
	    print color 'bright_cyan';
 	    print "Please input the email: ";
	    print color 'bright_yellow';
	    $mail = <>;
	    chomp ($mail);
	    print "\n";
	    print color 'bright_cyan';
	    print "Please input the cell number: ";
	    print color 'bright_yellow';
	    $cell = <>;
	    chomp ($cell);
 	    print color 'reset';
	    print "\n\n"
	}
elsif ($option eq 'R' || $option eq 'r' || $option eq 'Read' || $option eq 'read') 
	{
	    print "\n\n\"";
	    print color 'bright_green';
	    print "You Selected [I]nput";
	    print color 'reset';
	    print "\"\n\n";
	}
else
	{
	   
	    print "\n\n\"";
	    print color 'bright_green';
	    print "Your selection is invalid";
	    print color 'reset';
	    print "\"\n\n";
	}


