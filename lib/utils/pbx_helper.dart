import 'dart:io';

import 'package:icli/di/di.dart';
import 'package:icli/utils/ui.dart';

class PbxHelper {
  UI? ui;

  PbxHelper({UI? ui}) {
    this.ui = get<UI>(object: ui);
  }

  String removeFileReferences(String file, String pbxString) {
    return pbxString.replaceAll(RegExp(r"(.*" '$file' ".*)"), "");
  }

  String removeGroupReferences(String dir, String pbxString) {
    String str = pbxString.replaceAll(
        RegExp(r"(.*" "$dir" r".*\=\s\{([\s\S])+?(\};))"), "");
    return removeFileReferences(dir, str);
  }

  removeReferences(
      List<Map<FileSystemEntityType, String>> files, String pbxPath) {
    File pbx = File(pbxPath);
    String pbxString = pbx.readAsLinesSync().join("\n");

    for (var f in files) {
      switch (f.keys.first) {
        case FileSystemEntityType.file:
          pbxString = removeFileReferences(f.values.first, pbxString);
          break;
        case FileSystemEntityType.directory:
          pbxString = removeGroupReferences(f.values.first, pbxString);
          break;
        default:
          final type = f.keys.first;
          ui?.echo("Unhandled file entity => $type", Color.yellow);
      }
    }

    pbx.writeAsStringSync(pbxString);
  }
}
