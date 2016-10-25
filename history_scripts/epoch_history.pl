#!/usr/bin/env perl

use warnings;
use strict;

my ($fileIn, @details, $count);

begining();

sub begining{
  if (defined $ARGV[0]){
    foreach (@ARGV){
      $fileIn = $_;
      chomp($fileIn);
      @details =  split('\.', $fileIn);
      print_history($fileIn);
    }
  }   else {
    help_me();
  }
}

sub print_history{
  open(my $fh, $_[0]) or die "Could not open file '$_[0]' $!";
  $count = 0;
  my @arry = <$fh>;
  foreach my $a (@arry) {
    if ($a =~ /^#/) {
      my $b = $arry[$count + 1];
      chomp($a);
      $a =~ s/#//;
      my $realtime = localtime($a);
      chomp($b);
      my $data = "${realtime}¦${details[4]}¦${details[-3]}¦${details[-2]}¦$b";
      print $data, "\n";
    }
    $count ++;
  }

}

sub help_me{
   print "Usage:  get_history.pl <History File> \n";
   exit 1;
}
