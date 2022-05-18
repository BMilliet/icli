import 'package:icli/resources/resource_app_delegate.dart';
import 'package:icli/resources/resource_gitignore.dart';
import 'package:icli/resources/resource_infoplist.dart';

class Resources {
  String gitignore() {
    return ResourceGitignore().content();
  }

  String infoplist() {
    return ResourceInfoplist().content();
  }

  String appDelegate() {
    return ResourceAppDelegate().content();
  }
}
