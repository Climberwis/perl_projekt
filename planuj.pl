#!/usr/bin/perl
#Paweł Wiśniewski PJS_gr1

use Plan::Bib;

#foreach $wejscie (@ARGV)
#Tutaj help

print "Witaj w programie planuj wycieczkę!\n\n";

while(1){
	print "Podaj jaką masz kondycję:\n[1] - Słaba\n[2] - przeciętna\n[3] - dobra\n[h] - pomoc w wyborze\n";
	$kondycja = <>;
	if ( Plan::Bib::sprawdz_odp(3, $kondycja) ){
		last;
	}
}



print "Works!\n";
