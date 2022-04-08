import 'package:icli/di/di.dart';
import 'package:icli/utils/file_helper.dart';
import 'package:icli/utils/ui.dart';

class PbxHelper {
  UI? ui;
  FileHelper? fileHelper;

  PbxHelper({UI? ui, FileHelper? fileHelper}) {
    this.ui = get<UI>(object: ui);
    this.fileHelper = get<FileHelper>(object: fileHelper);
  }

  Future<void> removeLines(List<String> include, String pbxPath) {
    // TODO
  }
}
