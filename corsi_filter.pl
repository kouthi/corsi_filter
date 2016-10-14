#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my ($fname_input, $fname_output);
$fname_input = $ARGV[0];
$fname_output = $ARGV[1];

my %params = read_parameters();
foreach (keys %params) {
    say "$_: $params{$_}"
}

open my $input, "<", $fname_input or die ("error: could not open $!");
say $input;
while (<$input>) {
    chomp;
    my @line_args = split, ' ';
}


sub read_parameters {
    my %params;
    print "Npixel: "; chomp($params{"Npixel"} = <STDIN>); 
    print "Cd [fF]: "; chomp($params{ "Cd"} = <STDIN>);
    print "Cq [fF]: "; chomp($params{ "Cq"} = <STDIN>);
    print "Rq [kOhm]: "; chomp($params{ "Rq"} = <STDIN>);
    print "Cg [pF]: "; chomp($params{ "Cg"} = <STDIN>);
    return %params;
}
