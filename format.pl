#!/usr/bin/perl -w
###################################
###### Author: Shuyang Wang #######
###################################
use warnings;
use strict;

my $file = $ARGV[0];
my $outfile = "$file.copy";
my $len;
my $space;
open my $in, '<', $file or print "Can't read file: $!\n";
open my $out, ">$outfile" or print "Can't write new file $!\n";
while (<$in> ) {
	if ($_ =~ /\)\{/){
		s/\)\{/\) \{/;
	}
	if ($_ =~ /^(\t+)/) {
		$len = length($1);
		$space = "    "x$len;
		s/^(\t+)/$space/;
	}
	print $out $_;
}
close $out;
close $in;

unlink $file;
rename $outfile, $file;
