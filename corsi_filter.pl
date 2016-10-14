#!/usr/bin/env perl
use strict;
use warnings;
use 5.010
use Getopt::Long;

my ($fname_input, $fname_output);
$fname_input = $ARGV[0]
GetOptions('output=s' => \$fname_output);
print "Npixel: "; my $num_pixel = <STDIN>;
print "Cd [fF]: "; my $cd = <STDIN>;
print "Cq [fF]: "; my $cq = <STDIN>;
print "Rq [kOhm]: "; my $rq = <STDIN>;
print "Cg [pF]: "; my $cg = <STDIN>;


