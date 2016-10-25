#!/usr/bin/env perl

use warnings;
use strict;

sum_stuff();

sub sum_stuff{
  my @array = split(' ',  <STDIN>);
  print $array[0] + $array[1],  "\n";
}
