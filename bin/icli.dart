import 'dart:io';

import 'package:icli/di/di.dart' as di;
import 'package:icli/icli.dart' as icli;

void main(List<String> arguments) {
  di.injectInstances();

  try {
    icli.run(arguments);
  } catch (e) {
    print("icli: error on main execution\n$e");
    exit(1);
  }
}
