#!/usr/bin/perl
#Paweł Wiśniewski PJS_gr1

sub use_dir {
	my ($dirname) = @_;
	if($dirname eq "."){
	}
	else {
		$dirname = join('::', split('/', $dirname));
	}
}

use Getopt::Std;
use File::Basename;

$dirname = dirname($0);
$dirname = use_dir($dirname);

use FindBin;
use lib "$FindBin::RealBin/$dirname";
use Plan::Bib;



if( !getopts('h') ){
	die "./planuj.pl -h to help\n";
}
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
	if( $trudnosc == 1 ){
		print "\nIle czasu chcesz przeznaczyć:\n[1] - Do 4 godzin\n[2] - Do 6 godzin\n[h] - Pomoc\n";
		$czas = <>;
		if ( Plan::Bib::sprawdz_odp(2,$czas) ){
			last;
		}
	}
	elsif( $trudnosc == 2 ){
		print "\nIle czasu chcesz przeznaczyć:\n[1] - Do 4 godzin\n[2] - Do 6 godzin\n[3] - Do 8 godzin\n[h] - Pomoc\n";
		$czas = <>;
		if ( Plan::Bib::sprawdz_odp(3,$czas) ){
			last;
		}
	}
	elsif( $trudnosc == 3 ) {	
		print "[1] - Do 6 godzin\n[2] - Do 8 godzin\n[h] - Pomoc\n";
		$czas = <>;
		if ( Plan::Bib::sprawdz_odp(2,$czas) ){
			last;
			$czas += 1;
		}
	}
	elsif( $trudnosc == 4 ) {	
		print "[1] - Do 8 godzin\n[2] - Wyrypa powyżej 8 godzin\n[h] - Pomoc\n";
		$czas = <>;
		if ( Plan::Bib::sprawdz_odp(2,$czas) ){
			last;
			$czas += 2;
		}
	}
}

Plan::Bib::losuj($czas,$trudnosc);
