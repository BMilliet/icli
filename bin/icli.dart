import 'dart:io';

import 'package:icli/di/di.dart' as di;
import 'package:icli/icli.dart' as icli;

Future<void> main(List<String> arguments) async {
  di.injectInstances();

  try {
    await icli.run(arguments);
  } catch (e) {
    print("icli: error on main execution\n$e");
    exit(1);
  }
}
