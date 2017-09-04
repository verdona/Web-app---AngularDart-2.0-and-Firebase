const String jsonTagId = "id";
const String jsonTagNaziv = "naziv";
const String jsonTagOpis = "opis";
const String jsonTagTip = "tip";
const String jsonTagDuziOpis = "duziOpis";

class Osiguranje {
  String naziv;
  String opis;
  String tip;
  String id;
  String duziOpis;

  Osiguranje(this.id, this.naziv, this.opis, this.tip, this.duziOpis);

  Osiguranje.fromMap(Map map) :
        this(map['id'].toString(), map['naziv'], map['opis'], map['tip'], map['duziOpis']);

  static Map toMap(Osiguranje item) {
    Map jsonMap = {
      jsonTagId: item.id,
      jsonTagNaziv: item.naziv,
      jsonTagOpis:item.opis,
      jsonTagTip:item.tip,
      jsonTagDuziOpis:item.duziOpis
    };

    return jsonMap;
  }
}



