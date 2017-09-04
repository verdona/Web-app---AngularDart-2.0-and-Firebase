const String jsonTagIme = "ime";
const String jsonTagEmail = "email";
const String jsonTagSifra = "sifra";
const String jsonTagTipKorisnika = "tipkorisnika";

class Korisnik {

  String email;
  String ime;
  String sifra;
  String alterEgo;
  String tipKorisnika;

  Korisnik(this.ime, this.email, this.sifra, this.tipKorisnika,
      [this.alterEgo]);



  Korisnik.fromMap(Map map) :
        this(map['ime'], map['email'], map['sifra'], map['tipKorisnika']);

  static Map toMap(Korisnik item) {
    Map jsonMap = {
      jsonTagIme: item.ime,
      jsonTagEmail: item.email,
      jsonTagSifra:item.sifra,
      jsonTagTipKorisnika:item.tipKorisnika
    };
    return jsonMap;
  }
  //String toString() => '$ime';
}