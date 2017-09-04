const String jsonTagId = "id";
const String jsonTagDatum= "datum";
const String jsonTagNaslov= "naslov";
const String jsonTagVijest= "vijest";
const String jsonTagSlika= "slika";


class Vijest {
  String id;
  String naslov;
  String vijest;
  String datum;
  String slika;

  Vijest(this.id, this.naslov, this.vijest, this.datum, this.slika);


  Vijest.fromMap(String key, Map map) :
        this(key, map['naslov'], map['vijest'], map['datum'], map['slika']);

  Vijest.fromMapNew(Map map) :
        this("", map['naslov'], map['vijest'], map['datum'], map['slika']);

  static Map toMap(Vijest item) {
    Map jsonMap = {
      jsonTagId: item.id,
      jsonTagNaslov: item.naslov,
      jsonTagVijest: item.vijest,
      jsonTagDatum:item.datum,
      jsonTagSlika:item.slika
    };
    return jsonMap;
  }
  //String toString() => '$naslov';
}