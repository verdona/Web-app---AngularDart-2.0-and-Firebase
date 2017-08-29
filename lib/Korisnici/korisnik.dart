class Korisnik {

  String email;
  String ime;
  String sifra;
  String alterEgo;
  String tipKorisnika;

  Korisnik(this.ime, this.email, this.sifra, this.tipKorisnika,
      [this.alterEgo]);

  String toString() => '$ime';
}