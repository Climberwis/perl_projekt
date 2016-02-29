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
	my($krok) = @_;
	die "Pomoc :)"
}
1;
