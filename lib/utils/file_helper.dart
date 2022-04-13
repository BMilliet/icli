import 'dart:convert';
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

  Future<void> rm(List<String> paths,
      {bool pbxRemoval = false, String? pbxPath}) async {
    for (var file in paths) {
      if (await File(file).exists()) {
        ui?.echo("Deleting file => $file", Color.yellow);
        await File(file).delete();
      } else {
        ui?.echo("There is no file to be removed at: $file", Color.yellow);
        return;
      }
    }

    if (pbxRemoval) {
      await _removePbxReferences(paths, pbxPath);
    }
  }

  _removePbxReferences(List<String> paths, String? pbxPath) async {
    List<String> fileNames = [];

    if (pbxPath == null) {
      ui?.error("Missing pbx path");
    } else {
      final regx = RegExp(r'.*\/(\w+)\.\w+');
      for (var e in paths) {
        final match = regx.firstMatch(e);
        if (match != null) {
          fileNames.add(match.group(1).toString());
        }
      }

      print("search files $fileNames");

      File pbx = File(pbxPath);
      final filesLines = await pbx.readAsLines();
      List<int> linesToRemove = [];
      int index = 0;

      for (var l in filesLines) {
        if (l.contains("Main")) {
          linesToRemove.add(index);
        }
        index++;
      }

      print("Found Main on lines $linesToRemove");

      for (var i in linesToRemove) {
        filesLines.removeAt(i);
      }

      //await pbx.writeAsString(filesLines.join("\n"));
    }
  }

  Future<String?> find(RegExp regex, String path,
      {bool recursive = false}) async {
    final list = await dirContent(path, recursive: recursive);

    for (var e in list) {
      final match = regex.firstMatch(e);

      if (match != null) {
        return match.group(0);
      }
    }

    return null;
  }

  Future<List<String>> dirContent(String path, {bool recursive = false}) async {
    final dir = Directory(path);
    return await dir.list(recursive: recursive).map((e) => e.path).toList();
  }

  readFile(String path) async {
    final file = File(path);
    final content = await file.readAsLines(encoding: utf8);
    print(content);
  }
}
