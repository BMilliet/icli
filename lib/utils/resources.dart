import 'dart:io';

class Resources {
  String gitignore() {
    return _relative("resources/new_project/gitignore_template.txt");
  }

  String infoplist() {
    return _relative("resources/new_project/infoplist_template.txt");
  }

  String appDelegate() {
    return _relative("resources/new_project/appdelegate_template.txt");
  }

  String _relative(path) {
    return _root().replaceAll("bin/icli.dart", path);
  }

  String _root() {
    return Platform.script.path;
  }
}
