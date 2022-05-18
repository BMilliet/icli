import 'dart:io';

import 'package:icli/utils/pbx_helper.dart';
import 'package:icli/utils/ui.dart';

import 'ui_mock.dart';

class PbxHelperMock implements PbxHelper {
  @override
  UI? ui = UIMock();

  @override
  String removeFileReferences(String file, String pbxString) {
    // TODO: implement removeFileReferences
    return "";
  }

  @override
  String removeGroupReferences(String dir, String pbxString) {
    // TODO: implement removeGroupReferences
    return "";
  }

  @override
  removeReferences(List<Map<FileSystemEntityType, String>> files, String pbxPath) {
    // TODO: implement removeReferences
  }
}