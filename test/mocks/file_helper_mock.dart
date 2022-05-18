import 'dart:io';

import 'package:icli/utils/file_helper.dart';
import 'package:icli/utils/ui.dart';
import 'package:icli/utils/pbx_helper.dart';

import 'pbx_helper_mock.dart';
import 'ui_mock.dart';

class FileHelperMock implements FileHelper {
  @override
  PbxHelper? pbxHelper = PbxHelperMock();

  @override
  UI? ui = UIMock();

  var existingPaths = Map<String, bool>();
  var dirContents = Map<String, List<String>>();
  var rms = Map<String, bool>();
  var written = Map<String, String>();
  
  @override
  List<String> dirContent(String path, {bool recursive = false}) {
    return dirContents[path] ?? [];
  }
  
  @override
  bool fileExists(String path) {
    return existingPaths[path] ?? false;
  }
  
  @override
  List<Map<FileSystemEntityType, String>> fileNames(List<String> paths) {
    // TODO: implement fileNames
    return [];
  }
  
  @override
  String? find(RegExp regex, String path, {bool recursive = false}) {
    // TODO: implement find
    return null;
  }
  
  @override
  rm(List<String> paths, {String? removeFromPbx}) {
    // TODO: adjust
    for (var p in paths) {
      rms[p] = true;
    }
  }
  
  @override
  writeFile(String path, String content) {
    written[path] = content;
  }
}