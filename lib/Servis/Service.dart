import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:osiguranje11082017_v3/Korisnici/korisnik.dart';
import 'package:osiguranje11082017_v3/Osiguranje/osiguranje.dart';
import 'package:osiguranje11082017_v3/Pitanja/komentar.dart';
import 'package:osiguranje11082017_v3/Pitanja/pitanje.dart';
import 'package:osiguranje11082017_v3/Vijesti/Vijest.dart';
import 'package:firebase/firebase.dart' as fb;

@Injectable()
class Service {
  List<Osiguranje> osiguranja = [];
  List<Korisnik> korisniciBaza = [];
  List<Pitanje> pitanja = [];
  static Korisnik trenutniKorisnik;
  List<Vijest> vijesti = [];

  fb.DatabaseReference refKorisnici;
  fb.DatabaseReference refvijesti;
  fb.DatabaseReference refOsiguranja;
  fb.DatabaseReference refPitanja;

  fb.DatabaseReference refKomentari;

  Service() {
    fb.Database database = fb.database();

    refOsiguranja = database.ref('osiguranja/');
    refOsiguranja.limitToLast(100).onChildAdded.listen(_newInsurrance);

    refKorisnici = database.ref('korisnici/');
    refKorisnici.limitToLast(100).onChildAdded.listen(_newUser);

    refvijesti = database.ref('vijesti/');
    refvijesti.limitToLast(100).onChildAdded.listen(_newNews);
    refvijesti.limitToLast(100).onChildRemoved.listen(_removeNews);
    refvijesti.limitToLast(100).onChildChanged.listen(_changeNews);

    refPitanja = database.ref('pitanja/');
    refPitanja.limitToLast(100).onChildAdded.listen(_newQuestions);
  }

  void _newInsurrance(fb.QueryEvent event) {
    Osiguranje insurrance = new Osiguranje.fromMap(event.snapshot.val());
    insurrance.id = event.snapshot.key;
    osiguranja.add(insurrance);
  }

  void _newUser(fb.QueryEvent event) {
    Korisnik user = new Korisnik.fromMap(event.snapshot.val());
    korisniciBaza.add(user);
  }

  void _newNews(fb.QueryEvent event) {
    Vijest news = new Vijest.fromMap(event.snapshot.key, event.snapshot.val());
    vijesti.add(news);
  }

  void _removeNews(fb.QueryEvent event) {
    vijesti.removeWhere((news) => news.id == event.snapshot.key);
  }

  void _changeNews(fb.QueryEvent event) {
    Vijest news = new Vijest.fromMapNew(event.snapshot.val());
    vijesti.firstWhere((news) => news.id == event.snapshot.key).vijest =
        news.vijest;
    vijesti.firstWhere((news) => news.id == event.snapshot.key).naslov =
        news.naslov;
  }

  void _newQuestions(fb.QueryEvent event) {
    var pitanja1 = event.snapshot.val();
    Map kom = event.snapshot.child('komentari').val();
    if (pitanja1 != null) {
      List<Komentar> komentari = [];
      if (kom != null) {
        for (var komentar in kom.values) {
          Komentar k = new Komentar.fromMap(komentar);
          komentari.add(k);
        }
      }
      Pitanje question =
          new Pitanje.fromMap(event.snapshot.key, pitanja1, komentari);
      pitanja.add(question);
    }
  }

  //pitanja
  Future<List<Pitanje>> getPitanja() async => pitanja;
  Future<Pitanje> GetById(String id) async =>
      pitanja.firstWhere((pitanje) => pitanje.Id == id);
  Future<int> GetMaxPitanje() async => pitanja.length;

  DodajPitanje(Pitanje p) async {
    try {
      await refPitanja.push(Pitanje.toMap(p)).future;
    } catch (e) {
      print("Nastala je greška pri upisu u bazu!: $e");
    }
  }

  DodajKomentar(String pitanjeId, Komentar k) async {
    try {
      await refPitanja
          .child(pitanjeId)
          .child('komentari')
          .push(Komentar.toMap(k));
    } catch (e) {
      print("Nastala je greška pri brisanju vijesti $pitanjeId!: $e");
    }
  }

  //osiguranje
  Future<List<Osiguranje>> getOsiguranja() async => osiguranja;
  Future<Osiguranje> GetByNameOsiguranje(String naziv) async =>
      osiguranja.firstWhere((osiguranje) => osiguranje.naziv == naziv);
  Future<Osiguranje> GetOsiguranjeById(String id) async =>
      osiguranja.firstWhere((o) => o.id == id);

  //korisnici
  Future<String> getTipLogovanogKorisnika() async =>
      trenutniKorisnik.tipKorisnika;
  Future<Korisnik> getTrenutniKorisnik() async => trenutniKorisnik;
  Future<List<Korisnik>> getKorisniciBaza() async => korisniciBaza;

  SetKorisnik(Korisnik k) {
    trenutniKorisnik = new Korisnik(k.ime, k.email, k.sifra, k.tipKorisnika);
  }

  //vijesti
  Future<List<Vijest>> getVijesti() async => vijesti;

  Future<Vijest> GetVijestById(String id) async =>
      vijesti.firstWhere((v) => v.id == id);

  ObrisiVijest(String vijestId) async {
    try {
      await refvijesti.child(vijestId).remove();
    } catch (e) {
      print("Nastala je greška pri brisanju vijesti $vijestId!: $e");
    }
  }

  DodajVijest(Vijest v) async {
    try {
      await refvijesti.push(Vijest.toMap(v)).future;
    } catch (e) {
      print("Nastala je greška pri upisu u bazu!: $e");
    }
  }

  IzmijeniVijest(Vijest v) async {
    try {
      await refvijesti.child(v.id).update(Vijest.toMap(v));
    } catch (e) {
      print("Nastala je greška pri izmjeni podataka!: $e");
    }
  }
}
