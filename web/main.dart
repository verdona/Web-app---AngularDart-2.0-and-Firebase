// Copyright (c) 2017, Dzenana. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:osiguranje11082017_v3/Servis/Service.dart';
import 'package:osiguranje11082017_v3/app_component.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
  fb.initializeApp(
      apiKey: "AIzaSyBoO3CklXNReACBWzacUDRIG7pWt8Ii48k",
      authDomain: "osiguranje-3bb86.firebaseapp.com",
      databaseURL: "https://osiguranje-3bb86.firebaseio.com",
      storageBucket: "osiguranje-3bb86.appspot.com"
  );
  bootstrap(AppComponent, [Service]);
}
