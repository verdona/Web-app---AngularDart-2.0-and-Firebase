import 'dart:async';
import 'package:osiguranje11082017_v3/Pitanja/komentar.dart';

const String jsonTagId = "Id";
const String jsonTagNazivCovjeka= "nazivCovjeka";
const String jsonTagPitanje = "pitanje";
const String jsonTagDatum = "datum";
const String jsonTagTipKomentari = "komentari";

class Pitanje {
  Pitanje(this.Id, this.nazivCovjeka, this.pitanje, this.datum, this.komentari);

  String Id;
  String nazivCovjeka;
  String pitanje;
  String datum;
  List<Komentar> komentari;

  Pitanje.fromMap(String key, Map map, List<Komentar> komentari):
        this(key, map['nazivCovjeka'], map['pitanje'], map['datum'],komentari);



  static Map toMap(Pitanje item) {
    Map jsonMap = {
      jsonTagId: item.Id,
      jsonTagNazivCovjeka: item.nazivCovjeka,
      jsonTagPitanje: item.pitanje,
      jsonTagDatum: item.datum,
      jsonTagTipKomentari: item.komentari
    };
    return jsonMap;
  }
}