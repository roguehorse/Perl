#!usr/bin/perl
#regex1.pl
use warnings;
use strict;

my $pick;

print "Select the fruit you like: $pick";
$pick = <>;
chomp($pick);

if ( $pick =~ /apple/gi )
{
    print "$pick is a good choice!\n";
}
elsif ( $pick =~ /pear/gi )
{
    print "$pick is ok, but Apples are better\n";
}
else
{
    print "$pick is not a valid option, try again\n";
}

close;

