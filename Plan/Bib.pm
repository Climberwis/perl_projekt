#!/usr/bin/perl

package Plan::Bib;

sub sprawdz_liczba {
	my($zakres, $sprawdz) = @_;
		if( !($sprawdz =~ m{^\d+$}o) || $sprawdz==0 || $sprawdz > $zakres){
			print "Nie rozpoznano odpowiedzi!\n";
}}

sub open_track {
	my($url) = @_;
	system("x-www-browser \"$url\"");
}

sub pomoc {
	my($krok) = @_;
	print "to: $krok\n"
}
1;
