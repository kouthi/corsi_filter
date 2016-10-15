#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my ($fname_input, $fname_output);
$fname_input = $ARGV[0];
$fname_output = $ARGV[1];

my %params = read_parameters();
say "-----";
foreach (keys %params) {
    say "$_: $params{$_}";
}
say "-----";

open my $input, "<", $fname_input or die ("error: could not open $!");
my $flag_InstName = 0;
while (<$input>) {
    chomp;
    my @line_args = split, /' '/;
    say $line_args[2] if $flag_InstName;
    $flag_InstName = $line_args[1] eq "InstName" ? 1 : 0;
}

sub read_parameters {
    my %params;
    print "Npixel: "; chomp($params{"Npixel"} = <STDIN>); 
    print "Cd: "; chomp($params{"Cd"} = <STDIN>); 
    print "Cq: "; chomp($params{"Cq"} = <STDIN>); 
    print "Rq: "; chomp($params{"Rq"} = <STDIN>); 
    print "Cg: "; chomp($params{"Cg"} = <STDIN>); 
    return %params;
}
