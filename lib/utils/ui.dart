import 'dart:io';

class UI {
  error(String msg) {
    echo(msg, Color.red);
    exit(1);
  }

  echo(String? text, Color color) {
    String? msg = "";

    switch (color) {
      case Color.red:
        msg = _addColor(text, 31);
        break;
      case Color.green:
        msg = _addColor(text, 32);
        break;
      case Color.yellow:
        msg = _addColor(text, 33);
        break;
      case Color.blue:
        msg = _addColor(text, 34);
        break;
      case Color.cyan:
        msg = _addColor(text, 36);
        break;
      default:
        msg = text;
    }

    print(msg);
  }

  String _addColor(String? msg, int code) {
    final stringCode = code.toString();
    final section = [stringCode, "m", msg].join();
    return "\x1B[$section\x1B[0m";
  }
}

enum Color { red, green, blue, cyan, yellow }
