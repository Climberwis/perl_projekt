#! /usr/bin/perl
#Paweł Wiśniewski PJS_gr1
#chop, split, join, undef
#./wyrazy.pl n1 n2 plik1 plik2 ...
# wypisujemy wyrazy od niższego do wyższego
# jak pliku nie ma to wyrzucam error (nie byłem w stanie otworzyć takiego pliku)
sub sprawdz_liczba {
my($zakres, $sprawdz) = @_;
	if( !($sprawdz =~ m{^\d+$}o) || $sprawdz==0 || $sprawdz > $zakres){
		print "Nie rozpoznano odpowiedzi!\n";
}}

foreach $wejscie (@ARGV)
