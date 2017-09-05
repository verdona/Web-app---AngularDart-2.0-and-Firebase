import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:intl/intl.dart';
import 'package:osiguranje11082017_v3/Korisnici/korisnik.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';
import 'package:osiguranje11082017_v3/Pitanja/komentar.dart';
import 'package:osiguranje11082017_v3/Pitanja/pitanje.dart';


@Component(
    selector: 'forumOsiguranje',
    templateUrl: 'forumOsiguranje.html',
    providers: const [Service]
)
class ForumOsiguranjeComponent implements OnInit {

  ForumOsiguranjeComponent(this._Service);

  final Service _Service;

  @Input()
  List<Pitanje> pitanjaList;

  @Input() Korisnik korisnik;
  String visible = 'hidden';
  String display = 'none';
  bool odgovori;

  @override
  ngOnInit() async {
    pitanjaList = (await _Service.getPitanja());

    korisnik = await _Service.getTrenutniKorisnik();
    if(korisnik != null)
    {
      if (korisnik.ime == 'Prijavi se') {
        odgovori = true;
        querySelector('#postaviPitanje').style.visibility = 'hidden';
        querySelector('#postaviPitanje').style.display = 'none';
      }
      else {
        odgovori = false;
        querySelector('#postaviPitanje').style.visibility = 'visible';
        querySelector('#postaviPitanje').style.display = 'block';
      }
    }
  }

  OdgovoriClick(String idPitanje){
    var text = querySelectorAll('#'+idPitanje);
    if (visible == 'hidden') {
      text.style.visibility = 'visible';
      visible = 'visible';

      text.style.display = 'block';
      display = 'block';
    }
    else {
      text.style.visibility = 'hidden';
      visible = 'hidden';

      text.style.display = 'none';
      display = 'none';
    }
  }

  KomentarisiClick(String pitanjeId) async {
    Pitanje p = await _Service.GetById(pitanjeId.toString());
    var div = new DivElement();
    div  = querySelector('#'+pitanjeId);
    var komentar = div.querySelector("#komentar");
    TextAreaElement element = komentar;

    if (element.value != "") {
      Korisnik korisnik = await _Service.getTrenutniKorisnik();

      num idKomentara;
      if (p.komentari != null) {
        idKomentara =  (await p.komentari).length + 1;
      }
      else {
        idKomentara = 1;
         p.komentari = new List<Komentar>();
      }

      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(now);

      _Service.DodajKomentar(pitanjeId, new Komentar(
          idKomentara.toString(), korisnik.ime, element.value, formatted));

      OdgovoriClick(pitanjeId);
    }
  }

  PostaviPitanjeClick() async {
    num idPitanje = await _Service.GetMaxPitanje();
    Korisnik korisnik = await _Service.getTrenutniKorisnik();
    TextAreaElement element = querySelector('#pitanje');

    if (element.value != "") {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(now);
      List<Komentar> komentari = [];
      _Service.DodajPitanje(new Pitanje(
          (idPitanje + 1).toString(), korisnik.ime, element.value, formatted,
          komentari));
    }
  }

}