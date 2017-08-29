class Komentar {
  num Id;
  String nazivCovjeka;
  String komentar;
  String datum;

  String toString() => '$nazivCovjeka';

  Komentar(this.Id, this.nazivCovjeka, this.komentar, this.datum);
}