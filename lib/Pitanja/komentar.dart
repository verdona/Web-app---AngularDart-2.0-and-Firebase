const String jsonTagId = "id";
const String jsonTagNazivCovjeka= "nazivCovjeka";
const String jsonTagPitanje = "komentar";
const String jsonTagDatum = "datum";

class Komentar {
  String Id;
  String nazivCovjeka;
  String komentar;
  String datum;

  String toString() => '$nazivCovjeka';

  Komentar(this.Id, this.nazivCovjeka, this.komentar, this.datum);


  Komentar.fromMap(Map map) :
        this(map['id'].toString(), map['nazivCovjeka'], map['komentar'], map['datum']);

  static Map toMap(Komentar item) {
    Map jsonMap = {
      jsonTagId: item.Id,
      jsonTagNazivCovjeka: item.nazivCovjeka,
      jsonTagPitanje: item.komentar,
      jsonTagDatum: item.datum
    };
    return jsonMap;
  }
}