import 'dart:io';

import 'package:icli/di/di.dart';
import 'package:icli/utils/ui.dart';

class FileHelper {
  UI? ui;

  FileHelper({UI? ui}) {
    this.ui = get<UI>(object: ui);
  }

  Future<void> cp(String from, String to, bool force) async {
    if (await File(to).exists() && !force) {
      ui?.error(
          "File $to already exists, to override run the command with -f option");
    }

    try {
      await File(from).copy(to);
    } catch (e) {
      ui?.error("Could not copy file $from to $to\nError => $e");
    }
  }

  Future<List<String>> dirContent(String path) async {
    final dir = Directory(path);
    final list = dir.list(recursive: false).forEach((element) {
      if (element.path.endsWith(".xcodeproj")) {
        print("found");
      }
    });

    print(list);

    // find .xcodeproj to get main app name

    return [""];
  }
}
