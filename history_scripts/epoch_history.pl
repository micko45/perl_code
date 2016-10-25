#!/usr/bin/env perl

use warnings;
use strict;

my $fileIn = $ARGV[0];
chomp($fileIn);
my @details =  split('\.', $fileIn);
#print @details;
#print $details[6], "\n";

open(my $fh, $fileIn) or die "Could not open file '$fileIn' $!";
my $count = 0;

my @arry = <$fh>;
foreach my $a (@arry) {
  if ($a =~ /^#/) {
    my $b = $arry[$count + 1];
    chomp($a);
    $a =~ s/#//;
my $realtime = localtime($a);
    chomp($b);
    my $data = "$realtime: $details[4]: $details[6]:  $b";
    print $data, "\n";
  }
  $count ++;
}
