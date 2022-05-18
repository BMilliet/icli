

import 'package:icli/utils/ui.dart';

class UIMock implements UI {

  var echos = [];
  String? errors;

  UIMock() {
    clear();
  }

  @override
  echo(String? text, Color color) {
    echos.add(text);
  }

  @override
  error(String msg) {
    errors = msg;
  }

  void clear() {
    echos = [];
    errors = null;
  }
}