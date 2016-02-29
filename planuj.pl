#!/usr/bin/perl
#Paweł Wiśniewski PJS_gr1

sub sprawdz_liczba {
my($zakres, $sprawdz) = @_;
	if( !($sprawdz =~ m{^\d+$}o) || $sprawdz==0 || $sprawdz > $zakres){
		print "Nie rozpoznano odpowiedzi!\n";
}}

sub open_track {
my($url) = @_;
system("x-www-browser \"$url\"");
}

#foreach $wejscie (@ARGV)




print "Works!\n";
