import 'package:icli/di/di.dart';
import 'package:icli/utils/file_helper.dart';
import 'package:icli/utils/resources.dart';
import 'package:icli/utils/ui.dart';

class StoryBoardRemoveUseCase {
  UI? ui;
  Resources? resources;
  FileHelper? fileHelper;

  StoryBoardRemoveUseCase(
      {UI? ui, FileHelper? fileHelper, Resources? resources}) {
    this.ui = get<UI>(object: ui);
    this.fileHelper = get<FileHelper>(object: fileHelper);
    this.resources = get<Resources>(object: resources);
  }

  Future<void> run() async {
    final xcodeproj = await fileHelper?.find(RegExp(r'.*\.xcodeproj'), '.');
    final projectName = xcodeproj?.replaceFirst('.xcodeproj', '');

    if (projectName != null) {
      await _removeMainStoryboard(projectName);
      await _removeSceneDelegate(projectName);
      await _overrideInfoplist(projectName);
      await _overrideAppDelegate(projectName);
    } else {
      ui?.error("Cound not find main project dir");
    }
  }

  Future<void> _removeMainStoryboard(String projectDir) async {
    await fileHelper?.rm(projectDir + "/Base.lproj/Main.storyboard");
  }

  Future<void> _removeSceneDelegate(String projectDir) async {
    await fileHelper?.rm(projectDir + "/SceneDelegate.swift");
  }

  Future<void> _overrideInfoplist(String projectDir) async {
    final info = resources?.infoplist();
    final old = projectDir + "/Info.plist";

    if (info != null) {
      await fileHelper?.cp(info, old, true);
      ui?.echo("overwritten Info.plist", Color.green);
    } else {
      ui?.error("could not get Info.plist template");
    }
  }

  Future<void> _overrideAppDelegate(String projectDir) async {
    final info = resources?.appDelegate();
    final old = projectDir + "/AppDelegate.swift";

    if (info != null) {
      await fileHelper?.cp(info, old, true);
      ui?.echo("overwritten AppDelegate.swift", Color.green);
    } else {
      ui?.error("could not get AppDelegate template");
    }
  }
}
