#!usr/bin/perl
#Run Perltidy!

#Tutorial from: http://search.cpan.org/~ni-s/Tk-804.027/pod/UserGuide.pod

use warnings;
use strict;
use Tk;
use Digest::MD5;
use Digest::SHA;

my $fileSelect = ();

#Take top and bottom - now implicit top is in the middle
my $mw = MainWindow -> new;
$mw -> geometry ("350x300");
$mw->title( 'md5maker' );
 



$mw -> Label ( -text => 'This program will autogenerate hashes for selcted file' ) -> pack;
$mw -> Label() -> pack;
my $get = $mw -> Button ( -text => 'Get File', -command => \&open_file ) -> pack;
$mw -> Label() -> pack;
my $ent = $mw -> Entry(-width => 40) -> pack; 
&md5; 


sub open_file
{
  my @types =
   (["Select File",         '*']);
  $fileSelect = $mw -> getOpenFile ( -filetypes => \@types);
  $ent -> Insert ( $fileSelect );
} 

#sub md5
#{
#  my $sum = `md5sum $fileSelect`;
#  $mw -> Label() -> pack; 
#  $mw -> Label ( -text => 'The md5 value is' ) -> pack;
#  $mw -> Label ( -text => $sum ) -> pack;
#}





MainLoop;

