import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:intl/intl.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';
import 'package:osiguranje11082017_v3/Vijesti/Vijest.dart';

@Component(
    selector: 'dodajVijest',
    templateUrl: 'dodajVijest.html',
    providers: const [Service]
)
class DodajVijestComponent implements OnInit {

  DodajVijestComponent(this._Service);
  Service _Service;

  @Input()
  List<Vijest> vijestiList;

  @override
  ngOnInit() async {
    vijestiList = (await _Service.getVijesti());
  }

  DodajVijest() async {

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    TextAreaElement elementVijest = querySelector('#vijest');
    InputElement elementNaslov = querySelector('#naslov');
    InputElement lblElement = querySelector('#id');
    if(lblElement.value == ""){
      Vijest v =  new Vijest("1", elementNaslov.value, elementVijest.value, formatted, 'images/logo@2x.png');
      _Service.DodajVijest(v);
    }
    else
    {
      Vijest v =  new Vijest(lblElement.value, elementNaslov.value, elementVijest.value, formatted, 'images/logo@2x.png');
      _Service.IzmijeniVijest(v);
    }
    ClearForm();
  }

  ClearForm(){
    TextAreaElement elementVijest = querySelector('#vijest');
    InputElement elementNaslov = querySelector('#naslov');
    InputElement lblElement = querySelector('#id');
    InputElement elementSlika = querySelector('#slika');
    elementNaslov.value = " ";
    elementVijest.value = " ";
    lblElement.value = null;
    elementSlika.value = '';
  }
  ObrisiVijest(Vijest vijest){
    _Service.ObrisiVijest(vijest.id);
  }

  IzmijeniVijest(Vijest vijest){
    TextAreaElement elementVijest = querySelector('#vijest');
    InputElement elementNaslov = querySelector('#naslov');
    InputElement lblElement = querySelector('#id');
    elementNaslov.value = vijest.naslov;
    elementVijest.value = vijest.vijest;
    lblElement.value = vijest.id;
  }
}