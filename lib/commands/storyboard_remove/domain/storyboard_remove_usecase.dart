import 'package:icli/di/di.dart';
import 'package:icli/utils/file_helper.dart';
import 'package:icli/utils/ui.dart';

class StoryBoardRemoveUseCase {
  UI? ui;
  FileHelper? fileHelper;

  StoryBoardRemoveUseCase({UI? ui, FileHelper? fileHelper}) {
    this.ui = get<UI>(object: ui);
    this.fileHelper = get<FileHelper>(object: fileHelper);
  }

  Future<void> run() async {
    fileHelper?.dirContent(".");

    await _removeMainStoryboard();
    await _removeSceneDelegate();
    await _removeStoryBoardReferences();
    await _editAppDelegate();
  }

  Future<void> _removeMainStoryboard() async {}

  Future<void> _removeSceneDelegate() async {}

  Future<void> _removeStoryBoardReferences() async {}

  Future<void> _editAppDelegate() async {}
}
