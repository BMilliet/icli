import 'dart:io';

import 'package:icli/di/di.dart';
import 'package:icli/utils/pbx_helper.dart';
import 'package:icli/utils/ui.dart';

class FileHelper {
  UI? ui;
  PbxHelper? pbxHelper;

  FileHelper({UI? ui, PbxHelper? pbxHelper}) {
    this.ui = get<UI>(object: ui);
    this.pbxHelper = get<PbxHelper>(object: pbxHelper);
  }

  bool fileExists(String path) {
    final File file = File(path);
    return file.existsSync();
  }

  writeFile(String path, String content) {
    final File file = File(path);
    file.writeAsStringSync(content); 
  }

  // cp(String from, String to, bool force) {
  //   if (File(to).existsSync() && !force) {
  //     ui?.error(
  //         "File $to already exists, to override run the command with -f option");
  //   }

  //   try {
  //     File(from).copySync(to);
  //   } catch (e) {
  //     ui?.error("Could not copy file $from to $to\nError => $e");
  //   }
  // }

  // add(List<String> files) {
  //   ui?.echo("Adding files\n$files", Color.cyan);
  //   for (var f in files) {
  //     File(f).createSync();
  //   }
  //   ui?.echo("Adding references", Color.cyan);
  //   // TODO
  // }

  rm(List<String> paths, {String? removeFromPbx}) {
    if (removeFromPbx != null) {
      final files = fileNames(paths);
      pbxHelper?.removeReferences(files, removeFromPbx);
    }

    for (var file in paths) {
      _rm(file);
    }
  }

  _rm(String file) {
    if (File(file).existsSync()) {
      ui?.echo("Deleting file => $file", Color.yellow);
      File(file).deleteSync();
    } else {
      ui?.echo("There is no file to be removed at: $file", Color.yellow);
      return;
    }
  }

  String? find(RegExp regex, String path, {bool recursive = false}) {
    final list = dirContent(path, recursive: recursive);

    for (var e in list) {
      final match = regex.firstMatch(e);
      if (match != null) {
        return match.group(0);
      }
    }
    return null;
  }

  List<String> dirContent(String path, {bool recursive = false}) {
    final dir = Directory(path);
    return dir.listSync(recursive: recursive).map((e) => e.path).toList();
  }

  List<Map<FileSystemEntityType, String>> fileNames(List<String> paths) {
    List<Map<FileSystemEntityType, String>> fileNames = [];

    final regx = RegExp(r'.*\/(\w+)\.\w+');
    for (var e in paths) {
      FileSystemEntityType type;
      if (e.endsWith(".storyboard")) {
        type = FileSystemEntityType.directory;
      } else {
        type = FileSystemEntity.typeSync(e);
      }

      final match = regx.firstMatch(e);
      if (match != null) {
        fileNames.add({type: match.group(1).toString()});
      }
    }
    return fileNames;
  }
}
