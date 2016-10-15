#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my ($fname_input, $fname_output);
$fname_input = $ARGV[0];
$fname_output = $ARGV[1];

my $cd = { name => "Cd", unit => "fF" };
say $cd;
my $cq = { name => "Cq", unit => "fF" };
say $cq;
my $rq = { name => "Rq", unit => "kOhm" };
say $rq;
my $cg = { name => "Cg", unit => "pF" };
say $cg;
my %params = read_parameters($cd, $cq, $rq, $cg);
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
    say @_;
    my %params;
    print "Npixel: "; chomp($params{"Npixel"} = <STDIN>); 
    for (my $i = 0; $i < @_; $i++) {
        my $ref = shift;
        say $ref;
        #print "$ref->{'name'} [$ref->{'unit'}]: "; 
        #chomp($params{$ref->{'name'}} = <STDIN>);
    }
    return %params;
}
