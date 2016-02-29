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
