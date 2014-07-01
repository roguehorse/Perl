#!/usr/bin/perl

use strict;

## -- to run a line of perl from the command line: --
perl -pe 's/(<[A-Z][^>]*)style=(("[^"]*")|([^\s]))(.*>)/\1\3/ig' infile > outfile

## --- using additional modules
use Net::Telnet ();
use Net::Ping;
use Shell qw(wget);

## -- setting constants ------------
use constant DEBUG => 'true';
use constant ERR_EMAIL_TYPO => "Typo in the email address - please correct and resubmit.";
use constant ERR_EMAIL_FORMAT => "Email address in incorrect format - please correct and resubmit.";

## -------- variable control -----------
my $num1 = 10;
my $num2 = 20;
my ($num3,$num4,$num5) = (30,40,50); ## Array context - doing more than one variable

my $str6 = "a string";
my $str7 = 'another string'; ## can use single quotes
my $str8 = $str6 . " and " . $str7; ## concatenation

## ============= string concatenation ===============
$count = 1;
$count = $count + 1;          # increment count
$count += 1;                  # same thing
$count *=2;                   # doubles $count

$name = "John";
$name = $name + " Doe";       # adds two strings together
$name = $name . " Doe";       # safer way to do it
$name.=" Doe";                # shorter way

## ===== numerical comparisons =================

if ($version < 3)
{
   print "Too old, sorry!\n";
}

if ($total >= $budget)
{
   print "Overspent! Warning!\n";
}
else
{
   print "Still on target...\n";
}

# --------------- string tests ------------

if ($colour eq "white")
{
   print "Bright light!\n";
}

if ($username ne "root")
{
   print "Sorry, $username - permission denied.\n";
}

if ($something gt "root")
{
   print "I think $something comes later.\n";
}

## -- empty string
if ($input eq "")
{
   print "type something in!\n";
}

if (! $input)     # same thing – empty string is false
{
   print "type something in!\n";
}

## -- comparing numbers
if ($num == 0)
{
   print "type something in!\n";
}

if ($num)     # also works. Zero returns false.
{
   print "type something in!\n";
}

## ------------ loops -----------------
while ($counter < 10)    # no need to initialise $counter first.
{
    print "I can count to: $counter\n";
    $counter +=1;
}

until ($counter => 10)  # will break out at this "upper limit"
{
    print "Counter is currently: $counter\n";
    $counter +=1;
}

## -- for-loops
for ( $c = 0; $c < 10 ; $c++)
{
    print "The counter is: ".$c."\n";
}

for (1..10)
{
    print "The value is: $_ \n";
}

## -- running through a list/array
foreach $item (@list)
{
    print "The item is: $item \n";
}

foreach (@list)         ## using inbuilt $_
{
    print "The item is: $_ \n";
}

## ================= arrays ========================
@colours=("black","white","green","blue");   # 4-element array
@values=(10..100);                           # 91-element array
@colours=qw/black white green blue/;   # 4-element array

print "First colour is: $colours[0]\n";  # arrays are zero-based
print "Last colour is: $colours[-1]\n";  # prints "blue"
print "ALL colours are: @colours\n";  # entire array and newline

## ---------- parsing the array -------------
$element = 0;
while ($element < $#colours)  #  $#colours = array length
{
    print "Colour $element is: $colours[$element]\n";
    $element+=1;
}

foreach $shade (@colours)
{
    print "I think $shade is a pretty colour\n";
}

foreach (@colours)
{
    print "I think $_ is a pretty colour\n";
}

## -- sorting/joining arrays
@class = sort(@people);
($first, $second, $third) = sort @positions;

@queue = reverse(@people);
($last, $previous) = sort @positions;

$allnames = join ",",@names; # make a CSV list
$tones = join "\t",@colours; # tab-separated list
$birthday = join "-",7,12,1963; # get 7-12-1963

## ++++++++ POP and PUSH = end of array +++++++++++++++++++++++++++

@colours=qw/black white green yellow blue/;  # 5-element array
$tone = pop(@colours);   # @colours is 4-element, $tone = blue
$shade = pop @colours; # @colours now only 2-element

pop(@colours);  # lost green also.
pop @colours;   # white drops off. @colours is only "black"

push(@colours,"red");  # @colours now "black" and "red"
push(@colours,$tone);  # blue appended to the end
@hues=("dark","light"); # quick two-element array
push(@colours,@hues);  # added the two hues to the array

## +++++++++ SHIFT and UNSHIFT = start of array +++++++++++++++++++++

@colours=qw/black white green yellow blue/;  # 5-element array
$tone = shift(@colours);   # @colours is 4-element, $tone = black
$shade = shift @colours; # $shade = white
shift @colours;          # green is "shifted off"

unshift(@colours,"orange"); # pushes orange onto the start
unshift(@colours,@dulux);   # array "pushed" onto the front

## -------------- test input ------------------
@lines = <STDIN>;  # array context – reads until ^D or ^Z


## ============== associative arrays (hashes) ====================

$dimensions{'height'}= 20;
$dimensions{'width'}= 35;
$dimensions{'depth'}= 20;
$dimensions{'type'}= "box";

##-- using "quick write"
%dimensions = qw/height 20 width 40 depth 15 type box/

##-- using "quick write" but formatted to view key/value pairs
%dimensions = qw/height 20
                 width  40
                 depth  15
                 type   box/

$dimensions{'weight'} = 43; # Add a new key/value pair
$dimensions{'type'} = "sink"; # reassigning a value

$num = keys %dimensions;
print "there are " . $num . " characteristics available\n\n";

## --- unwinding an associative array

foreach (keys %dimensions)
{
    print $_ ." contains the value of: ".$dimensions{$_} ."\n";
}

## --- creating a hash from STDIN
my %words;
print "Enter a word at a time, end with EOF\n";
chomp (my @lines=<STDIN>);

foreach (@lines)
{
    $words{$_}+=1;
}

## ========== Input Basics =================
print "please enter your name: ";
$name=<STDIN>;
print "Hello there, $name\n";

print "Please type a number followed by ENTER: ";
chomp($num=<STDIN>);              # just number without newline

if ($num > 10)
{
    print "Sorry, $num is too big.\n";
}

## =============== REGEX tests =========================
if (/^[a-z]/)
if ($_ =~ /^[a-z]/ )        # same thing - both test the value of $_

## -- changing delimiter - modify / to another characyer
if ($_ =~ m#^[a-z]# )
if ($input =~ m{^[a-z]} )       ## tests a different variable
if ($field =~ m<[^0-9]$> )

## -- Use /i for case-insensitive match:
if ($choice =~ /^y/i )
if (/^y/i )

## substitution (changing characters within a string) - works like SED
$dirname =~ s/^([a-zA-Z_]+)\d+\.jpg$/$1/i;


## ================ command-line parameters ================

## -- check that one parameter has been passed
## -- if not, error with a usage statement
if(@ARGV != 1)
{
    print ("*** missing filename ***\n");
    exit;
}

## @ARGV = argument values.

## =============== FILE handling ===================

$settingsfile = "settings.ini";
$status = open SETTINGS, "< $settingsfile";
if (! $status)
{
    print "Failed to open ". $settingsfile."\n";
}

unless ($success)
{
    print "Failed to open ". $settingsfile."\n";
}

unless (open INIFILE, "<config.ini")
{
    die "Failed to open file: error is $!";
}

open CONFIG, "<settings.ini" or die "Error: $!";
open CONFIG, $cfgfile || die "Error $! with $cfgfile";

while(<CONFIG>)    # while a line can be read in
{
    chomp;
    print("The line is: $_ \n"); # or more processing here.
    if (/^$/)
    {
        print "EMPTY LINE!\n";
    }
}

print LOG "Line is: $_";  # line goes to LOG not STDOUT

select LOG      ## use LOG instead of STDIN
print "<pre>\n";
print "Beginning to process $inputfile \n";
print $date;
print "</pre>\n";

close CONFIG_FILE;
close INPUT_FILE;
close OUTPUT_FILE;
close LOGFILE;

## ++++++++++ file attribute operations ++++++++++++++
@statistics = stat($filename);

my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev,
    $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat($filename);

my $access_time = $statistics[8];
my $modification_time = $statistics[9]; # <-- use this for Linux
my $create_time = $statistics[10];


sub digit
{
    ## -- just pads out single-digit with two digits
    my $value = pop(@_);
    sprintf "%02d",$value;
}

sub lower
{
    ## -- lower-case value.
    my $value = pop(@_);
    $value =~ s/(.)/\L$1/g;
    $value;
}

sub lower2 ## same thing, but uses inbuilt variable. $_ is GLOBAL!
{
    ## -- lower-case value.
    $_ = pop(@_);
    s/(.)/\L$1/g;
    $_;
}

## ~~~~~~~~~~~~~~ directory operations ~~~~~~~~~~~~~~~

chdir "/tmp" or die("Cannot use temp directory: $!");

my $oracle_home = '/oracle/product/10.1.2/db_1';
chdir $oracle_home or die "No oracle set? $!";

my @dirlist = glob "*";
my @bitmaps = glob "*.bmp";  # filter for specific filetypes
my @bmps = <*.bmp>;   # same thing
my @images = glob "*.bmp *.jpg *.png *.gif"; # several types

foreach $filename (readdir APACHE) # get a filename
{
    print("I can see: $filename \n"); # or more processing here.
}

foreach (readdir CONFDIR)
{
    print("in $conf is $_ \n"); # or more processing here.
}

## ============== DBM hashes ======================
##
## saves an associative array out to a file.
## The keys/values are saved, the name of the actual array is unimportant.
##
dbmopen(%myhash, "database.dbm", 0664)
         or die "Problem with database file: $!";

dbmopen(%myhash, "database.dbm", 0664) || die "problems!";

foreach (keys %myhash)
  { print $_ ." contains the value of: ".$myhash{$_} ."\n"; }

dbmclose(%myhash) or die "Problem with database file: $!";


## ============== MYSQL stuff ==============
##
## - creating an assoc array.
my %db = (  'hostname' => 'oracleserver',
            'database' => 'stock',
            'username' => "system",
            'password' => 'manager');

use DBI;

## build the connection string here
my $dbconn = 'DBI:mysql';
$dbconn .= ':host='.$db{'hostname'};
$dbconn .= ':database='.$db{'database'};


## now let's connect
my $dbh = DBI->connect($dbconn,$db{'username'},$db{'password'})
          or die ("DB connection issues - $DBI::errstr");

## prepare a statement
my $sth = $dbh->prepare("select * from publishers");

## execute the query
$sth->execute;

## now let's iterate through the statement handler
while(@row = $sth->fetchrow())
{
    ## print out 3rd field
    print($row[2]."\n");
}

## finally disconnect from the database
$dbh->disconnect;
print("\n--- finished --- \n");


## ================== FUNCTIONS ===============
sub strip
{
    my $oldname;
    my $replace = pop(@_);

    print("Stripping: ".$replace."\n");
}

## -- call this with:
&strip par1 par2;

## USING CPAN:
perl –MCPAN –e 'install DBI'
perl –MCPAN –e 'install DBD::mysql'

## ++++++++++++ debugging +++++++++++++++++
##
## -- added these "GOT HERE" lines throughout your code
debug("DEBUG returned:".$reply);

## -- flick the constant DEBUG to false to disable these messages:
sub debug
{
    ## DEBUG should be a constant set at the start
    ## -- flick to FALSE to hide these lines.
    if(DEBUG eq "true") { print("DEBUG:".$_[0]."\n") };
}
