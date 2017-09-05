import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:osiguranje11082017_v3/Osiguranje/osiguranje.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';

@Component
  (
  selector: 'osiguranjedetalji',
  templateUrl: 'osiguranjedetalji.html',
  styleUrls: const ['style.css'],
  providers: const [Service],
  inputs: const['odabranoOsiguranje'],
)
class OsiguranjeDetaljiComponent
    implements OnInit {
  OsiguranjeDetaljiComponent(this._Service, this._routeParams);

  Service _Service;
  RouteParams _routeParams;
  @Input() Osiguranje osiguranje;
  String naziv;
  String tip;

  @override
  ngOnInit() async {
    var id = int.parse(_routeParams.get('id'));
    osiguranje = (await _Service.GetOsiguranjeById(id.toString()));
    if(osiguranje != null){
      naziv = osiguranje.naziv;
      tip = osiguranje.tip;
    }

  }

}
