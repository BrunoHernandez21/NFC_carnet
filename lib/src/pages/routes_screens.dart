import 'package:flutter/cupertino.dart';
import 'package:nfc_app/src/pages/home/home_page.dart';


class Ruts {
  static final Map<String, WidgetBuilder> _ruts = {
    HomePage.rutePage: (_) => const HomePage(),
    
  };

  static get ruts {
    return _ruts;
  }
}
