import 'dart:html';
import 'package:angular2/angular2.dart';


@Component(
  selector: 'kontakt',
  templateUrl: 'kontakt.html',
  styleUrls: const ['style.css'],
)
class KontaktComponent {

  bool skriveno = true;

  PosaljiUpit() {
    querySelector('#poruka').hidden = skriveno;

    querySelector('#uspjesnaPoruka').hidden = !skriveno;
  }
}