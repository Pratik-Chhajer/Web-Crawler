#!usr/bin/perl
use LWP::Simple;
use open ':std', ':encoding(UTF-8)';

@LINKS = ();

$link = "http://www.geeksforgeeks.org/";

open($write,">","visited.txt");

push @LINKS ,$link;

foreach(@LINKS){
	$link = $_;
	if(length($link)>1){
		$source = get($link);
		print "$link\n";
		while($source =~ /href='([\S]+)'/gi){
			print $write "$1\n";
			push @LINKS, $1;
		}
	}
}
close($write);
