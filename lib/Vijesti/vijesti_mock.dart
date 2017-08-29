import 'package:intl/intl.dart';
import 'package:osiguranje11082017_v3/Vijesti/Vijest.dart';

var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String formatted = formatter.format(now);

List<Vijest> vijesti = [

  new Vijest(1, "Izvršena isplata najveće poslijeratne štete u BiH",
      "Emona osiguranje d.d Sarajevo je izvršilo akontativnu isplatu u iznosu od 5.000.000 KM za štetu društva Bingo d.o.o. Tuzla na objektu u Mostaru koji je uništen u požaru. Ostatak iznosa štete će biti isplaćen nakon konačnog nalaza nadležnih organa. Tim povodom je Uprava Emona osiguranja dana 11.08.2017. godine, bila u posjeti kod osiguranika Bingo d.o.o. Tuzla, gdje je iskazano obostrano "
          "zadovoljstvo i spremnost na dalju poslovnu saradnju.Napominjemo da je Emona osiguranje d.d Sarajevo krajem mjeseca juna 2017.godine osiguraniku Bingo d.o.o. Tuzla već isplatilo 1 milion KM za štetu po polici kojom je bila osigurana roba u objektu.",
      formatted,
      "http://www.sarajevoosiguranje.ba/wp-content/uploads/bfi_thumb/bingo-34e9qj0xmnotk5eqy4jy80.jpg"),

  new Vijest(2, "Emona osiguranje zadržala lidersku poziciju",
      "Emona osiguranje je zadržalo lidersku poziciju  na tržištu osiguranja u Bosni i Hercegovini, sa premijom od 29.220.501 KM nakon prvih šest mjeseci 2017. godine. Premije u ovoj osiguravajućoj kući su povećane za više od pet miliona KM u odnosu na prvih pet mjeseci iste godine, kada su iznosile 24 miliona KM. Portal Biznisinfo podsjeća da je na drugom mjestu oosiguravajućih društava u FBiH Uniqa osiguranje sa 29.162.928 KM ostvarenih premija u prvoj polovici ove godine. Uniqa osiguranje je prošle i početkom ove godine bilo tržišni lider, "
          "prije nego se Emona osiguranje vratilo na tu poziciju. Na trećem mjestu je Euroherc osiguranje s iznosom premije od 27.863.648 KM, a slijede BSO (25.131.956), Croatia (25.077.867), Triglav (22.622.501), Grawe (19.080.051), Merkur BH (14.885.058), Central (12.160.367), ASA (11.710.013), VGT (9.427.769), Zovko (9.418.943) i Camelia osiguranje (5.720.548). "
          "Ukupna premijera osiguravajućih društava u Federaciji za pola godine iznosi 241.482.151 KM, u odnosu na 225.012.587 iz istog perioda 2016. Najveći dioničar u Emona osiguranju je Federacija BiH sa oko 45,5 posto vlasništva.",
      formatted,
      "images/lider.jpg"),

  new Vijest(3,
      "Izvještaj o događaju koji bitno utiče na finansijsko poslovanje emitenta",
      "Društvo za osiguranje EMONA-OSIGURANJE d.d. Sarajevo. U skladu sa članom 4. "
          "Pravilnika o sadržaju, rokovima i načinu objavljivanja izvještaja emitenta objavljujemo: I Z V J E Š T A J O DOGAĐAJU KOJI BITNO UTIČE NA FINANSIJSKO POSLOVANJE EMITENTA",
      formatted, "images/finansijskoposlovanje.jpg"),
];