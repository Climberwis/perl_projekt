#!/usr/bin/perl

package Plan::Bib;

sub sprawdz_odp {
	my($zakres, $sprawdz) = @_;
		if( $sprawdz=~ m/^(h|H)/ ){
			pomoc();
		}
		if( !($sprawdz =~ m{^\d+$}o) || $sprawdz==0 || $sprawdz > $zakres){
			print "Nie rozpoznano odpowiedzi!\n\n";
			return 0;
		}
	return 1;
}

sub open_track {
	my($url) = @_;
	system("x-www-browser \"$url\"");
}

sub trasy {
	my($czas, $trud, $los) = @_;
	@trasy = (
	["http://mapa-turystyczna.pl/route?q=282n,2322n,2324n,282n", "http://mapa-turystyczna.pl/route?q=625n,656n,625n",
	 "http://mapa-turystyczna.pl/route?q=221n,3240n,221n"], #spacery do 4 h/0
	["http://mapa-turystyczna.pl/route?q=250n,278n,250n", "http://mapa-turystyczna.pl/route?q=243n,221n,185n,269n,206n,243n",
	"http://mapa-turystyczna.pl/route?q=50n,43n,6n,43n,41n,50n"], #spacery do 6 h/1
	["http://mapa-turystyczna.pl/route?q=10n,14t,3t,10n", "http://mapa-turystyczna.pl/route?q=897n,928n,897n",
	"http://mapa-turystyczna.pl/route?q=4115n,262n,300n,297n"], #lekkie do 4h/2
	["http://mapa-turystyczna.pl/route?q=897n,928n,103n", "http://mapa-turystyczna.pl/route?q=103n,94n,102n,3915n,103n",
	"http://mapa-turystyczna.pl/route?q=87n,64n,62n,78n,88n"], #lekkie do 6h/3
	["http://mapa-turystyczna.pl/route?q=89n,114n,115n,89n", "http://mapa-turystyczna.pl/route?q=250n,239n,199n,250n",
	"http://mapa-turystyczna.pl/route?q=233n,304t,275n,270n,250n"], #lekkie do 8h/4
	["http://mapa-turystyczna.pl/route?q=103n,114n,127t,103n","http://mapa-turystyczna.pl/route?q=585n,659n,613n,722t,585n",
	"http://mapa-turystyczna.pl/route?q=625n,556n,841t,656n,796t,625n"], #średnie do 6h/5
	["http://mapa-turystyczna.pl/route?q=625n,627n,711n,681n,625n", "http://mapa-turystyczna.pl/route?q=87n,115n,114n,103n",
	"http://mapa-turystyczna.pl/route?q=585n,711n,698n"], #średnie do 8h/6
	["http://mapa-turystyczna.pl/route?q=695n,840t,879t,695n", "http://mapa-turystyczna.pl/route?q=233n,4112n,2517n",
	"http://mapa-turystyczna.pl/route?q=2517n,304t,228n,2517n"], #trudne do 8h/7
	["http://mapa-turystyczna.pl/route?q=2517n,304t,293n,237t,2517n", "http://mapa-turystyczna.pl/route?q=250n,272n,250n",
	"http://mapa-turystyczna.pl/route?q=250n,257t,292n,3485t,250n"], #trudne wyrypy/8
	);
	if( $trud == 1 ){
		open_track($trasy[$czas-1]->[$los]);
	}
	if( $trud == 2 ){
		open_track($trasy[$trud+$czas-1]->[$los]);
	}
	if( $trud == 3 ){
		open_track($trasy[$trud+$czas+1]->[$los]);
	}
	if( $trud == 4 ){
		open_track($trasy[$trud+$czas+2]->[$los]);
	}
}

sub losuj {
	my($czas, $trud) = @_;
	$los = int(rand(3));
	trasy($czas, $trud, $los);	
}

sub pomoc {
	print "Planuj - skrypt do szybkiego wyboru wycieczek górskich! Wymagane połączenie z Internetem!\n\n";
	print "./planuj.pl [opcje]\n\n";
	print "Opcje:\n-h/--help\t-\turuchamia pomoc (to co czytasz!).\n\n\n";

	print "Instrukcja działania:\nSkrypt zada Ci serię pytań dotyczących Twoich planów i preferencji.\n";
	print "Po otrzymaniu wszystkich informacji, zostanie otwarta domyślna przeglądarka z trasą proponowanej wycieczki w Beskidach bądź Tatrach.\n\n";

	print "Sekcja kondycja:\nSłaba kondycja - spacer pod górę powoduje zadyszkę, osoba nie porusza się na codzień za dużo.\n";
	print "Średnia kondycja - osoba potrafi przejść ok 10 km ciągiem, podejście pod średnio stromą górę nie sprawia wielkich problemów.\n";
	print "Dobra kondycja - osoba porusza się sprawnie po terenie górskim.\n\n";

	print "Sekcja trudność:\nLekki spacer - spacery dolinne, często dojście do schroniska.\n";
	print "Lekka górska wycieczka - wycieczka w terenie, gdzie podejścia nie stanowią głównej części trasy.\n";
	print "Średnia górska wycieczka - podejścia stanowią główną część trasy. Szlak nie jest wymagający technicznie.\n";
	print "Trudna górska wycieczka - trasa, która wymaga umiejętności. Mogą występować sztuczne ułatwienia, a pomoc może dotrzeć dość późno.\n\n";

	print "Sekcja długości wycieczki:\nCzasy jak opisano.\n\n";
	
	print "Autorem tras jest autor skryptu. Skrypt wykorzystuje serwis mapa-turystyczna.pl celem wyświetlenia wycieczki. \n";
	print "Kontakt: pawel.wis93@gmail.com\n" ;
	die "\n";
}
1;

