#!usr/bin/perl
#Keeper v1
use warnings;
use strict;
use Tk;

my $mw = MainWindow -> new;
$mw -> resizable (0,0);
 $mw -> title ("Keeper v1");

 my $lblSite = $mw -> Label (-text => "Site") -> grid
  (my $tboxSite = $mw -> Entry (-width => 40));
 
 my $lblID = $mw -> Label (-text => "User/ID") -> grid
  (my $tboxID = $mw -> Entry (-width => 40));

 my $lblEmail = $mw -> Label (-text => "Email") -> grid
  (my $tboxEmail = $mw -> Entry (-width => 40));

 my $lblPass = $mw -> Label (-text => "Pass") -> grid
  (my $tboxPass = $mw -> Entry (-width => 40));

 my $space = $mw -> Label () -> grid;

 my $btnEnter = $mw -> Button (-text => "Enter") -> grid
  (my $btnSearch = $mw -> Button (-text => "Search"),"x",
   my $btnClose = $mw -> Button (-text => "Close", -command => sub {exit}));
 




MainLoop;

