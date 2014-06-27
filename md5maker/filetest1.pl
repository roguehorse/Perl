#!/usr/bin/perl -w
use strict;

use Tk;
my $current_file=();

our $mw = MainWindow->new;
$mw->configure(-title=> "some title");
$mw->geometry("1000x400+0+0");

my $menu_f = $mw->Frame()->pack(-side=>'top',-fill=>'x');
my $menu_file = $menu_f->Menubutton
                    (-text=>'File',-tearoff=>'false')
                    ->pack(-side=>'left');
$menu_file->command(-label=>'Open',
		    -command=> \&open_pdf);                     

sub open_pdf
{
   my @types =
       (["PDF files", [qw/.PDF /]],
        ["All files",		'*'],
       );
   $current_file= $mw->getOpenFile(-filetypes => \@types);
   print "$current_file\n";
}

MainLoop();
