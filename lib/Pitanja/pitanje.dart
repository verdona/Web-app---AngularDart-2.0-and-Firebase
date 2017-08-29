import 'package:osiguranje11082017_v3/Pitanja/komentar.dart';


class Pitanje {
  Pitanje(this.Id, this.nazivCovjeka, this.pitanje, this.datum, this.komentari);

  num Id;
  String nazivCovjeka;
  String pitanje;
  String datum;
  List<Komentar> komentari;

  String toString() => '$nazivCovjeka';
}