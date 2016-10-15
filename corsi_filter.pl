#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my ($fname_input, $fname_output);
$fname_input = $ARGV[0];
$fname_output = $ARGV[1];

my $npixel = { name => 'Npixel', unit => '' };
my $cd = { name => 'Cd', unit => 'fF' };
my $cq = { name => 'Cq', unit => 'fF' };
my $rq = { name => 'Rq', unit => 'kOhm' };
my $cg = { name => 'Cg', unit => 'pF' };
my %params = read_parameters($npixel, $cd, $cq, $rq, $cg);
say '-----';
foreach (keys %params) {
    say "$_: $params{$_}";
}
say '-----';

open my $input, '<', $fname_input or die ("error: could not open $!");
my $flag_InstName = 0;
while (<$input>) {
    chomp;
    my @line_args = split, /' '/;
    say $line_args[2] if $flag_InstName;
    $flag_InstName = $line_args[1] eq 'InstName' ? 1 : 0;
}

sub read_parameters {
    my %params;
    for (my $i = 0; $i < @_; $i++) {
        print "$_[$i]{'name'} [$_[$i]{'unit'}]: ";
        chomp($params{$_[$i]{'name'}} = <STDIN>); 
    }
    return %params;
}
