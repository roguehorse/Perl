#!usr/bin/perl
#Run Perltidy!


use warnings;
use strict;
use Tk;
use Digest::MD5::File qw(md5_hex);
use Digest::SHA qw(sha1_hex sha256_hex);

my $fileSelect = ();
my $text1 = ();

my $mw = MainWindow -> new;
$mw -> geometry ("350x300");
$mw->title( 'md5maker' );
 

$mw -> Label ( -text => 'This program will autogenerate hashes for selcted file' ) -> pack;
$mw -> Label() -> pack;
my $get = $mw -> Button ( -text => 'Get File', -command => \&open_file ) -> pack;
$mw -> Label() -> pack;
my $ent = $mw -> Entry(-width => 40) -> pack; 


sub open_file
{
  my @types =
   (["Select File", '*.*']);
  $fileSelect = $mw -> getOpenFile ( -filetypes => \@types);
  $ent -> Insert ($fileSelect);
  
   if ($fileSelect eq "")
   {
     $mw -> Label() -> pack;
     $mw -> Label ( -text => 'No file selected' ) -> pack;
   }
   else
   { 
     $mw -> Label() -> pack;
     $mw -> Label ( -text => 'The md5 value is' ) -> pack;
     $mw -> Label ( -text => md5_hex($fileSelect)) -> pack;
   }
}



MainLoop;

