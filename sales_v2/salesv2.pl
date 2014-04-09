#!/usr/bin/perl
#Don't forget to run perltidy!
use warnings;
use strict;
use Tk;

#A company has recently changed it's compensation policy to improves sales.
#A salesperson will earn a fixed salary of $75,000 with a sales target of $120,000.
#A sales incentive will start when 80% of their sales incentive has been met
#with a commission rate of 7%.
#If a salesperson exceeds the target, the commission will increase based on an acceleration factor of 1.5%
#The application should ask the user to enter annual sales and should display total compensation
#The application should also display a table of potential total annual compensation the sales person
#could have earned in $5000 increments above the salespersons annual sales,
#until it reaches 50% above the salesperson's annual sales.

#***** This program was originally written by Scott DuBois in Java
#***** and converted on 3/29/14 by Scott DuBois

my $fixed            = 75000;
my $target          = 120000;
my $incentive     = .80;
my $commission = .07;
my $accelerator  = 1.5;

my $gross;
my $gross1;
my $gross2;

system ('clear');
print "\n\nThis program calculates if a salesperson\n";
print "has produced enough money in sales to earn a\n";
print "sales bonus.\n\n";
sleep 2;
print "The program will then provide a listing of what\n";
print "the salesperson could have earned in \$5000 increments.\n\n\n";
sleep 2;
print "Please enter the amount produced in sales: \$";

my $sales = <STDIN>;

system ('clear');
sleep 2;

if ( $sales < $target * $incentive )
{
    print "\nYou have not generated enough in sales\n";
    print "to earn a bonus.\n\n";
    printf "Your earnings are \$%.2f\n\n\n", $fixed;
}
elsif ( $sales >= $target * $incentive && $sales <= $target )
{
    print "\nCongratulations! You have generated enough\n";
    print "in sales to earn a bonus.\n\n";
    $gross1 = $sales * $commission + $fixed;
    printf "Your total earning with commission come to \$%.2f\n\n\n", $gross1;
}
else
{
    print "\nCongratulations! You have generated enough\n";
    print "in sales to earn a bonus plus incentives!\n\n";
    $gross2 = $sales * ( $commission * $accelerator ) + $fixed;
    printf
"Your total earning with commission and incentives comes to \$%.2f\n\n\n", $gross2;
}
sleep 3;
print "The following table represents the amount\n";
print "in compensation up to 50% above your\n";
print "current achievement.\n\n";
sleep 2;

my $table = $sales;

print "  Sales Amount  -->  Earnings\n";
print "  ---------------------------\n";
sleep 2;

while ( $table <= $sales * 1.5 )
{
    printf "  \$%.2f", $table;
    if ( $table >= $target )
    {
        $gross2 = $table * ($commission * $accelerator) + $fixed;
        sleep 1;
        printf "  -->   \$%.2f\n", $gross2;
        $table = $table + 5000;
    }
    elsif ( $table >= $target * $incentive && $table < $target )
    {
        $gross1 = $table * $commission + $fixed;
        sleep 1;
        printf "  -->   \$%.2f\n", $gross1;
        $table = $table + 5000;
    }
    else
    {
        $gross = $sales;
        sleep 1;
        printf "  -->   \$%.2f\n", $gross;
        $table = $table + 5000;
    }
}
print "\n\n";

