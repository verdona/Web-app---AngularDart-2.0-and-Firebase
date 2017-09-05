
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:osiguranje11082017_v3/Osiguranje/osiguranje.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';

@Component(
    selector: 'planosiguranja',
    templateUrl: 'planosiguranja.html',
    styleUrls: const ['style.css'],
    directives: const [ROUTER_DIRECTIVES],
    providers: const [Service]
)
class PlanOsiguranjaComponent implements OnInit {

  PlanOsiguranjaComponent(this._osiguranjeService);

  Service _osiguranjeService;

  List<Osiguranje> osiguranja = [];

  @override
  ngOnInit() async {
    osiguranja = (await _osiguranjeService.getOsiguranja());
  }

}