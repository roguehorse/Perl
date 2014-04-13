#!/usr/bin/perl
#Don't forget to run perltidy!

use warnings;
use strict;
use Term::ANSIColor;

#*****************************Orginial Algorithm*******************************#
#A company has recently changed it's compensation policy to improves sales.    #
#A salesperson will earn a fixed salary of $75,000 with a sales target of      #
#$120,000. A sales incentive will start when 80% of their sales goal has       #
#been met with a commission rate of 7%.					       #
#If a salesperson exceeds the target, the commission will increase based on an #
#acceleration factor of 1.5%.						       #
#The application should ask the user to enter annual sales and should display  #
#total compensation.	      						       #
#The application should also display a table of potential total annual         #
#compensation the sales person could have earned in $5000 increments above     #
#the salespersons annual sales,				                       #
#until it reaches 50% above the salesperson's annual sales.                    #
#                     			                                       #
#***** This program was originally written by Scott DuBois in Java             #
#***** and converted on 3/29/14 by Scott DuBois                                #
#                                                                              #
#******This program builds on the original as outlined below**********         #
#The application will now compare the total copaensation of at least two       #
#sales people.                         					       #
#It will calculate the additional amount of sales that each salesperson        #
#must achieve to match or exceed the higher of the two earners.		       #
#				                                               #
#******This amended Java program was originally written by Scott DuBois        #	
#******Converted to Perl on 4/8/2014 by Scott DuBois in Vim.                   #
#******************************************************************************#

my $fixed       = 75000;
my $target      = 120000;
my $incentive   = .80;
my $commission  = .07;
my $accelerator = 1.5;

my ( @names, @sales );

my ( $sales, $names,  $x,      $z,      $spX );
my ( $gross, $gross1, $gross2, $gross3, $gross4 );
my ( $table1, $table2 );

#*************Clear screen and describe program**************

system('clear');
print "\n\n";
printf "%61s", 'This program calculates if either salesperson';
print "\n";
printf "%64s", 'has produced enough in sales to earn a sales bonus.';
print "\n\n";
sleep 2;
printf "%66s", 'Then the program will determine how much more in sales';
print "\n";
printf "%71s", 'the lesser of the two must produce to match the greater producer.';
print "\n\n";
sleep 2;
printf "%62s", 'The program will then provide a listing of what';
print "\n";
printf "%49s", 'each salesperson could have earned in ';
print color 'bright_green';
print "\$5000";
print color 'reset';
print " increments.";
print "\n\n\n";
sleep 2;

#**************************************************************

#**************Get names of the sales people*******************

#Get salesperson names
for ( $x = 1 ; $x < 3 ; $x++ )
{
    print "\n";
    printf "%40s", 'Please enter salesperson';
    print color 'bright_yellow';
    print " $x ";
    print color 'reset';
    print "first name: ";
    print color 'bright_yellow';
    $names = <>;
    chomp($names);
    push @names, $names;
    print color 'reset';
}

#*************************************************************

#***************Get sales input from each person**************

#Get amount in sales from each person
sleep 1;
for ( $z = 1 ; $z < 3 ; $z++ )
{
    if ( $z == 1 )
    {
	print "\n";
        printf "%55s", 'Please enter the amount produced in sales for ';
	print color 'bright_yellow';
        printf "$names[0]";
	print color 'bright_green';
	print " \$";
    }
    else
    {
	print "\n";
        printf "%55s", 'Please enter the amount produced in sales for ';
	print color 'bright_yellow';
        printf "$names[1]";
	print color 'bright_green';
	print " \$";
    }
  
    $sales = <>;
    chomp($sales);
    push @sales, $sales;
    print color 'reset';    

    if ( $sales <= 0 )
    {
	print "\n";
	print color 'red';
        printf "%60s", 'Value must be greater than zero!';
	print color 'reset';
	print "\n";
        pop @sales;
        $z = $z - 1;
    }
}

sleep 1;
print "\n\n\n\n";
printf "%35s", '"';
print color 'bright_yellow';
print "Thank you";
print color 'reset';
printf "\"\n\n";
sleep 3;

#*************************************************************

#**************Determine Who Earned More**********************

#Determine difference in sales between salesperson
my $salesdiff1 = ( $sales[0] - $sales[1] );
my $salesdiff2 = ( $sales[1] - $sales[0] );

system('clear');
if ( $sales[0] > $sales[1] )
{
    print "\n\n";
    print color 'bright_yellow';
    printf "%22s", $names[1];
    print color 'reset';
    print " must earn ";
    print color 'bright_green';
    printf "\$%.2f", $salesdiff1;
    print color 'reset';
    print  " more to match ";
    print color 'bright_yellow';
    print "$names[0]\n";
    print color 'reset';
}
elsif ( $sales[1] > $sales[0] )
{
    print "\n\n";
    print color 'bright_yellow';
    printf "%22s", $names[0];
    print color 'reset';
    print " must earn ";
    print color 'bright_green';
    printf "\$%.2f", $salesdiff2;
    print color 'reset';
    print  " more to match ";
    print color 'bright_yellow';
    print "$names[1]\n";
    print color 'reset';
}
else
{
    print "\n\n";
    print color 'bright_yellow';
    printf "%22s", $names[0];
    print color 'reset';
    print " has earned the same amount as ";
    print color 'bright_yellow';
    print "$names[1]\n";
    print color 'reset';
}

#**************************************************************

#**********Determine if first salesperson gets a bonus*********

#determine if salesperson 1 has earned a bonus
for ( $x = 1 ; $x < 2 ; $x++ )
{
    if ( $sales[0] >= $target )
    {
	print "\n\n\n";
        printf "%50s", 'Bonuses will be awarded to >> ';
	print color 'bright_yellow';
        print "$names[0]\n";
	print color 'reset';
        printf "%50s", 'Gross income earned will be >> ';
        $gross2 = $sales[0] * $commission * $accelerator + $fixed;
        print color 'bright_green';
        printf "\$%.2f", $gross2;
	print color 'reset';
    }
    elsif ( $sales[0] >= $incentive * $target && $sales[0] < $target )
    {
	print "\n\n";
        printf "%50s", 'A bonus will be awarded to >> ';
	print color 'bright_yellow';
        print "$names[0]\n";
	print color 'reset';
        printf "%50s", 'Gross income earned will be >> ';
        $gross1 = $sales[0] * $commission + $fixed;
	print color 'bright_green';
        printf "\$%.2f", $gross1;
	print color 'reset';
    }
    else
    {
	print "\n\n";
        printf "%50s", 'No bonus will be awarded to >> ';
	print color 'bright_yellow';
        print "$names[0]\n";
	print color 'reset';
        printf "%50s", 'Gross income earned will be >> ';
	print color 'bright_green';
        printf "\$%.2f", $fixed;
	print color 'reset';
    }
}

#****************************************************************

#**********Determine if second salesperson gets a bonus**********

#detrmine is salesperson 2 has earned a bonus
for ( $z = 1 ; $z < 2 ; $z++ )
{
    if ( $sales[1] >= $target )
    {
	print "\n\n";
        printf "%50s", 'Bonuses will be awarded to >> ';
	print color 'bright_yellow';
        print "$names[1]\n";
	print color 'reset';
        printf "%50s", 'Gross income earned will be >> ';
        $gross4 = $sales[1] * $commission * $accelerator + $fixed;
	print color 'bright_green';
        printf "\$%.2f", $gross4;
	print color 'reset';
    }
    elsif ( $sales[1] >= $incentive * $target && $sales[1] < $target )
    {
	print "\n\n";
        printf "%50s", 'A bonus will be awarded to >> ';
	print color 'bright_yellow';
        print "$names[1]\n";
	print color 'reset';
        printf "%50s", 'Gross income earned will be >> ';
        $gross3 = $sales[1] * $commission + $fixed;
	print color 'bright_green';
        printf "\$%.2f", $gross3;
	print color 'reset';
    }
    else
    {
	print "\n\n";
        printf "%50s", 'No bonus will be awarded to >> ';
	print color 'bright_yellow';
        print "$names[1]\n";
	print color 'reset';
        printf "%50s", 'Gross income earned will be >> ';
	print color 'bright_green';
        printf "\$%.2f", $fixed;
	print color 'reset';
    }
}

#*****************************************************************

#********Create possible salary values for first salesperson*******

#Create table for first salesperson
print "\n\n";
printf "%50s", 'Possible compensation for >> ';
print color 'bright_yellow';
print "$names[0]\n";
print color 'reset';
printf "%52s", 'Sales Amount  -->  Earnings';
print "\n";
print color 'bright_blue';
printf "%52s", '---------------------------';
print color 'reset';
print "\n";
sleep 1;

#Create table values based on sales value from first salesperson
$table1 = $sales[0];
while ( $table1 < $sales[0] * $accelerator )
{
    sleep 1;
    print color 'bright_green';
    printf "%26s", '$';
    printf "%.2f", $table1;
    print color 'reset';
    if ( $table1 >= $target )
    {
        $gross2 = ( $table1 * ( $commission * $accelerator ) + $fixed );
        print "   -->   ";
	print color 'bright_green';
	printf "\$%.2f\n", $gross2;
	print color 'reset';
        $table1 = $table1 + 5000;
    }
    elsif ( $table1 >= $incentive * $target && $table1 < $target )
    {
        $gross1 = ( $table1 * $commission + $fixed );
	if ( $table1 <= 99999 )
	{
	    print "    -->   ";
	    print color 'bright_green';
	    printf "\$%.2f\n", $gross1;
	    print color 'reset';
            $table1 = $table1 + 5000;
	}    	
	else
 	{
            print "   -->   ";
	    print color 'bright_green';
	    printf "\$%.2f\n", $gross1;
	    print color 'reset';
            $table1 = $table1 + 5000;
	}
    }
    else
    {
        $gross = $fixed;
        print "    -->   ";
	print color 'bright_green';
	printf "\$%.2f\n", $gross;
	print color 'reset';
        $table1 = $table1 + 5000;
    }
}

#*****************************************************************

#*******Create possible salary values for second salesperson*******

#Create table for second salesperson
print "\n\n";
printf "%50s", 'Possible compensation for >> ';
print color 'bright_yellow';
print "$names[1]\n";
print color 'reset';
printf "%52s", 'Sales Amount  -->  Earnings';
print "\n";
print color 'bright_blue';
printf "%52s", '---------------------------';
print color 'reset';
print "\n";
sleep 1;

#Create table values based on sales value from second salesperson
$table2 = $sales[1];
while ( $table2 < $sales[1] * $accelerator )
{
    sleep 1;
    print color 'bright_green';
    printf "%26s", '$';
    printf "%.2f", $table2;
    print color 'reset';
    if ( $table2 >= $target )
    {
        $gross4 = ( $table2 * ( $commission * $accelerator ) + $fixed );
        print "   -->   ";
	print color 'bright_green';
	printf "\$%.2f\n", $gross4;
	print color 'reset';
        $table2 = $table2 + 5000;
    }
    elsif ( $table2 >= $incentive * $target && $table2 < $target )
    {
        $gross3 = ( $table2 * $commission + $fixed );
	if ( $table2 <= 99999 )
	{
 	    print "    -->   ";
	    print color 'bright_green';
	    printf "\$%.2f\n", $gross3;
	    print color 'reset';
            $table2 = $table2 + 5000;
	}    
	else
	{
            print "   -->   ";
	    print color 'bright_green';
	    printf "\$%.2f\n", $gross3;
	    print color 'reset';
            $table2 = $table2 + 5000;
	}
    }
    else
    {
        $gross = $fixed;
        print "    -->   ";
	print color 'bright_green';
	printf "\$%.2f\n", $gross;
	print color 'reset';
        $table2 = $table2 + 5000;
    }
}

#******************************************************************
print "\n\n";

