class Vijest {
  num Id;
  String naslov;
  String vijest;
  String datum;
  String slika;

  Vijest(this.Id, this.naslov, this.vijest, this.datum, this.slika);

  String toString() => '$naslov';
}