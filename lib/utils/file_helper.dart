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

  Future<void> rm(String path) async {
    if (await File(path).exists()) {
      ui?.echo("Deleting file => $path", Color.yellow);
      await File(path).delete();
    } else {
      ui?.echo("There is no file to be removed at: $path", Color.yellow);
      return;
    }
  }

  Future<String?> find(RegExp regex, String path,
      {bool recursive: false}) async {
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
