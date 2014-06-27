#!usr/bin/perl
use warnings;
use strict;
use Tk;

my $mw = MainWindow -> new;
$mw -> Label ( -text => 'Md5Maker' ) -> pack;
$mw -> Button 
 (
   -text => 'quit',
   -command => sub { exit },
 ) -> pack;
MainLoop;
