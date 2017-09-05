// Copyright (c) 2017, Dzenana. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.
library example.json_to_object;
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:osiguranje11082017_v3/Osiguranje/osiguranje.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';
import 'package:osiguranje11082017_v3/dodajVijest_component.dart';
import 'package:osiguranje11082017_v3/forumosiguranje_component.dart';
import 'package:osiguranje11082017_v3/Korisnici/korisnik.dart';
import 'package:osiguranje11082017_v3/kontakt_component.dart';
import 'package:osiguranje11082017_v3/onama_component.dart';
import 'package:osiguranje11082017_v3/osiguranjedetalji_component.dart';
import 'package:osiguranje11082017_v3/planosiguranja_component.dart';
import 'package:osiguranje11082017_v3/pocetna_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const[CORE_DIRECTIVES, ROUTER_DIRECTIVES],
    providers: const [Service, ROUTER_PROVIDERS]
)
@RouteConfig(const[
  const Route(path: '/pocetna',
      name: 'Pocetna',
      component: PocetnaComponent,
      useAsDefault: true),
  const Route(path: '/planosigurnja',
      name: 'PlanOsiguranja',
      component: PlanOsiguranjaComponent),
  const Route(path: '/forum',
      name: 'ForumOsiguranja',
      component: ForumOsiguranjeComponent),
  const Route(path: '/onama', name: 'ONama', component: ONamaComponent),
  const Route(path: '/kontakt', name: 'Kontakt', component: KontaktComponent),
  const Route(
      path: '/novavijest', name: 'Vijest', component: DodajVijestComponent),
  const Route(path: '/vijestdetalji',
      name: 'OsiguranjeDetaljiComponent',
      component: OsiguranjeDetaljiComponent),
])
class AppComponent
    implements OnInit {

  AppComponent(this._service);

  @Input()
  List<Korisnik> korisniciBaza = [];

  @Input()
  List<Osiguranje> osiguranja = [];

  bool submitted = false;
  bool novaVijest = true;

  Service _service;
  Korisnik korisnik = new Korisnik("Prijavi se","","","user");


  num count = 0;
  var osiguranje;

  @override
  ngOnInit() async {
    korisniciBaza = (await _service.getKorisniciBaza());
    osiguranja = (await _service.getOsiguranja());
    _service.SetKorisnik(korisnik);
  }


  PrijaviSe1() {
    if(querySelector('#login-dp').style.visibility == 'hidden')
    {
      querySelector('#login-dp').style.visibility = 'visible';
    }
  }
  PrijaviSe() {
    if(korisniciBaza != null)
    {
      if (korisniciBaza.firstWhere((k) => k.email == korisnik.email) != null) {
        korisnik = korisniciBaza.firstWhere(((k) => k.email == korisnik.email));
        if(korisnik.tipKorisnika == 'admin')
        {
          novaVijest = false;
        }
        else
        {
          novaVijest = true;
        }
      }
    }
    querySelector('#login-dp').style.visibility = 'hidden';
    _service.SetKorisnik(korisnik);
  }

  OdjaviSe() {
    korisnik = new Korisnik("Prijavi se",null,null,null);
    novaVijest = true;
    querySelector('#login-dp').style.visibility = 'hidden';
    _service.SetKorisnik(korisnik);
  }
}
