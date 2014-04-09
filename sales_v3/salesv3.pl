#!/usr/bin/perl
#Don't forget to run perltidy!
use warnings;
use strict;
use Tk;

#*****************************Orginial Algorithm***************************
#A company has recently changed it's compensation policy to improves sales.
#A salesperson will earn a fixed salary of $75,000 with a sales target of $120,000.
#A sales incentive will start when 80% of their sales goal has been met
#with a commission rate of 7%.
#If a salesperson exceeds the target, the commission will increase based on an acceleration factor of 1.5%
#The application should ask the user to enter annual sales and should display total compensation
#The application should also display a table of potential total annual compensation the sales person
#could have earned in $5000 increments above the salespersons annual sales,
#until it reaches 50% above the salesperson's annual sales.

#***** This program was originally written by Scott DuBois in Java
#***** and converted on 3/29/14 by Scott DuBois
#
#******This program builds on the original as outlined below**********
#The application will now compare the total copaensation of at least two sales people
#It will calculate the additional amount of sales that each salesperson must achieve to match or
#exceed the higher of the two earners.
#******This amended Java program was originally written by Scott DuBois
#******Converted to Perl on 4/8/2014 by Scott DuBois

my $fixed       = 75000;
my $target      = 120000;
my $incentive   = .80;
my $commission  = .07;
my $accelerator = 1.5;

my ( @names, @sales );

my ( $sales, $names,  $x,      $z,      $spX );
my ( $gross, $gross1, $gross2, $gross3, $gross4 );
my ( $table1, $table2 );

system('clear');
print "\n\nThis program calculates if either salesperson\n";
print "has produced enough in sales to earn a sales bonus.\n\n";
sleep 2;
print "Then the program will determine how much more in sales\n";
print "the lesser of the two must produce to match the greater producer.\n\n";
sleep 2;
print "The program will then provide a listing of what\n";
print "each salesperson could have earned in \$5000 increments.\n\n";
sleep 2;

#Get salesperson names
for ( $x = 1 ; $x < 3 ; $x++ )
{
    print "\nPlease enter salesperson $x first name: ";
    $names = <>;
    chomp($names);
    push @names, $names;
}

#Get amount in sales from each person
sleep 2;
for ( $z = 1 ; $z < 3 ; $z++ )
{
    if ( $z == 1 )
    {
        printf "\nPlease enter the amount produced in sales for ";
        printf "$names[0] \$";
    }
    else
    {
        printf "\nPlease enter the amount produced in sales for ";
        printf "$names[1] \$";
    }

    $sales = <>;
    chomp($sales);
    push @sales, $sales;
    if ( $sales <= 0 )
    {
        print "\nValue must be greater than zero";
        pop @sales;
        $z = $z - 1;
    }
}

system('clear');
sleep 2;

#determine if salesperson 1 has earned a bonus
for ( $x = 1 ; $x < 2 ; $x++ )
{
    if ( $sales[0] >= $target )
    {
        print "Bonuses will be awarded to >> ";
        print "$names[0]\n";
        print "Gross income earned will be >> ";
        $gross2 = $sales[0] * $commission * $accelerator + $fixed;
        printf "\$%.2f", $gross2;
    }
    elsif ( $sales[0] >= $incentive * $target && $sales[0] < $target )
    {
        print "A bonus will be awarded to >> ";
        print "$names[0]\n";
        print "Gross income earned will be >> ";
        $gross1 = $sales[0] * $commission + $fixed;
        printf "\$%.2f", $gross1;
    }
    else
    {
        print "No bonus will be awarded to >> ";
        print "$names[0]\n";
        print "Gross income earned will be >> ";
        printf "\$%.2f", $fixed;
    }
}

#detrmine is salesperson 2 has earned a bonus
for ( $z = 1 ; $z < 2 ; $z++ )
{
    if ( $sales[1] >= $target )
    {
        print "\n\nBonuses will be awarded to >> ";
        print "$names[1]\n";
        print "Gross income earned will be >> ";
        $gross4 = $sales[1] * $commission * $incentive + $fixed;
        printf "\$%.2f", $gross4;
    }
    elsif ( $sales[1] >= $incentive * $target && $sales[1] < $target )
    {
        print "\n\nA bonus will be awarded to >> ";
        print "$names[1]\n";
        print "Gross income earned will be >> ";
        $gross3 = $sales[1] * $commission + $fixed;
        printf "\$%.2f", $gross3;
    }
    else
    {
        print "\n\nNo bonus will be awarded to >> ";
        print "$names[1]\n";
        print "Gross income earned will be >> ";
        printf "\$%.2f", $fixed;
    }
}

#Determine difference in sales between salesperson
my $salesdiff1 = ( $sales[0] - $sales[1] );
my $salesdiff2 = ( $sales[1] - $sales[0] );
if ( $sales[0] > $sales[1] )
{
    printf "\n\n$names[1] must earn \$%.2f", $salesdiff1;
    print  " more to match $names[0]\n";
}
elsif ( $sales[1] > $sales[0] )
{
    print "\n\n$names[0] must earn \$%.2f", $salesdiff2;
    print " more to match $names[1]\n";
}
else
{
    print "\n\n$names[0] has earned the same amount as $names[1]\n";
}

#Create table for first salesperson
print "\n\nPossible compensation for >> ";
print "$names[0]\n";
print "  Sales Amount  -->  Earnings\n";
print "  ---------------------------\n";
sleep 2;

#Create table values based on sales value from first salesperson
$table1 = $sales[0];
while ( $table1 < $sales[0] * $accelerator )
{
    printf "  \$%.2f", $table1;
    if ( $table1 >= $target )
    {
        $gross2 = ( $table1 * ( $commission * $accelerator ) + $fixed );
        sleep 1;
        printf "   -->   \$%.2f\n", $gross2;
        $table1 = $table1 + 5000;
    }
    elsif ( $table1 >= $incentive * $target && $table1 < $target )
    {
        $gross1 = ( $table1 * $commission + $fixed );
        sleep 1;
        printf "   -->   \$%.2f\n", $gross1;
        $table1 = $table1 + 5000;
    }
    else
    {
        $gross = $fixed;
        sleep 1;
        printf "   -->   \$%.2f\n", $gross;
        $table1 = $table1 + 5000;
    }
}

#Create table for second salesperson
print "\n\nPossible compensation for >> ";
print "$names[1]\n";
print "  Sales Amount  -->  Earnings\n";
print "  ---------------------------\n";
sleep 2;

#Create table values based on sales value from second salesperson
$table2 = $sales[1];
while ( $table2 < $sales[1] * $accelerator )
{
    printf "  \$%.2f", $table2;
    if ( $table2 >= $target )
    {
        $gross4 = ( $table2 * ( $commission * $accelerator ) + $fixed );
        sleep 1;
        printf "   -->   \$%.2f\n", $gross4;
        $table2 = $table2 + 5000;
    }
    elsif ( $table2 >= $incentive * $target && $table2 < $target )
    {
        $gross3 = ( $table2 * $commission + $fixed );
        sleep 1;
        printf "   -->   \$%.2f\n", $gross3;
        $table2 = $table2 + 5000;
    }
    else
    {
        $gross = $fixed;
        sleep 1;
        printf "   -->   \$%.2f\n", $gross;
        $table2 = $table2 + 5000;
    }
}
print "\n\n";

