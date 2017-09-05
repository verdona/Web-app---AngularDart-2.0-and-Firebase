import 'package:angular2/angular2.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';
import 'package:osiguranje11082017_v3/Vijesti/Vijest.dart';

@Component(
  selector: 'pocetna',
  templateUrl: 'pocetna.html',
  styleUrls: const ['style.css'],
)
class PocetnaComponent implements OnInit {

  PocetnaComponent(this._service);

  @Input()
  List<Vijest> vijesti = [];
  Service _service;

  @override
  ngOnInit() async {
    vijesti = (await _service.getVijesti());
  }

}