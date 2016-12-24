#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my $fname_input = shift;
my $fname_output = shift;

my @corsi_components = (
     { name => 'Npixel', unit => '' },
     { name => 'Cd', unit => 'fF' },
     { name => 'Cq', unit => 'fF' },
     { name => 'Rq', unit => 'kOhm' },
     { name => 'Cg', unit => 'pF' }
);
my $params = read_parameters(@corsi_components);
output_components($params);

open my $input, '<', $fname_input or die ("error: could not open $!");
open my $output, '>', $fname_output or die ("error: could not open $!");
my $instName = '';
while (<$input>) {
    chomp; my @line_args = split, /' '/;
    if ($instName) {
        foreach (@corsi_components) {
            if ($instName eq $_->{'name'}) {
                $line_args[2] = $params->{$_->{'name'}};
            }
        }
    }
    $instName = $line_args[1] eq 'InstName' ? $line_args[2] : '';
    say $output join ' ', @line_args;
}

sub read_parameters {
    my $refparams = {};
    for (my $i = 0; $i < @_; $i++) {
        print "$_[$i]{'name'} [$_[$i]{'unit'}]: ";
        chomp($refparams->{$_[$i]{'name'}} = <STDIN>); 
    }
    return $refparams;
}

sub output_components {
    my $refparams = shift;
    say '-----';
    foreach (keys %{$refparams}) {
        say "$_: $refparams->{$_}" if $refparams->{$_} ne '';
    }
    say '-----';
}
