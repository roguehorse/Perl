#!usr/bin/perl
use warnings;
use strict;
use Digest::MD5 qw(md5_hex);

print "Digest is ", md5_hex("foobar"), "\n";

