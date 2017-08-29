import 'package:intl/intl.dart';
import 'package:osiguranje11082017_v3/Pitanja/komentari_mock.dart';
import 'package:osiguranje11082017_v3/Pitanja/pitanje.dart';

var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String formatted = formatter.format(now);

List<Pitanje> pitanja = [

  new Pitanje(
      1, 'Azra', 'Kako se najčešće određuje vrednost za osiguranja imovine?',
      formatted, komentariVrijednosti),


];
