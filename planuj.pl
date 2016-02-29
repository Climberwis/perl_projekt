#!/usr/bin/perl
#Paweł Wiśniewski PJS_gr1

use Plan::Bib;
use Getopt::Std;

getopts('h');
if( $opt_h ){
	Plan::Bib::pomoc();
}

print "Witaj w programie planuj wycieczkę!\n\n";

while(1){
	print "\nPodaj jaką masz kondycję:\n[1] - Słaba\n[2] - Przeciętna\n[3] - Dobra\n[h] - Pomoc\n";
	$kondycja = <>;
	if( Plan::Bib::sprawdz_odp(3, $kondycja) ) {
		last;
	}
}

while(1){
	print "\nJaką trudność wycieczki planujesz:\n[1] - Lekki spacer (np. doliną)\n[2] - Lekka górska wycieczka\n";
	
	if( $kondycja >= 2 ) {	
		print "[3] - Średnia górska wycieczka\n";
	}
	if( $kondycja >= 3 ) {	
		print "[4] - Trudna górska wycieczka\n";
	}
	
	print "[h] - Pomoc\n";
	$trudnosc = <>;
	if ( Plan::Bib::sprawdz_odp($kondycja + 1, $trudnosc) ){
		last;
	}
}

while(1){
	print "\nIle czasu chcesz przeznaczyć:\n[1] - Do 4 godzin\n[2] - Do 6 godzin\n";
	
	if( $trudnosc >= 3 ) {	
		print "[3] - Do 8 godzin\n[4] - Ostra wyrypa\n";
		$trudnosc = 3;
	}
	print "[h] - Pomoc\n";
	$czas = <>;
	if ( Plan::Bib::sprawdz_odp($trudnosc+1,$czas) ){
		last;
	}
}
