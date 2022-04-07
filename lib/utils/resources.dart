import 'dart:io';

class Resources {
  String gitignore() {
    return _relative("resources/gitignore_template.txt");
  }

  String _relative(path) {
    return _root().replaceAll("bin/icli.dart", path);
  }

  String _root() {
    return Platform.script.path;
  }
}
