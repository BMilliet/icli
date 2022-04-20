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

  run() {
    final xcodeproj = fileHelper?.find(RegExp(r'.*\.xcodeproj'), '.');
    final projectName = xcodeproj?.replaceFirst('.xcodeproj', '');
    final pbxPath = "$xcodeproj/project.pbxproj";

    if (projectName != null) {
      _removeFiles(projectName, pbxPath);
      _overrideInfoplist(projectName);
      _overrideAppDelegate(projectName);
    } else {
      ui?.error("Cound not find main project dir");
    }
  }

  _removeFiles(String projectDir, String pbxPath) {
    final files = [
      "$projectDir/Base.lproj/Main.storyboard",
      "$projectDir/SceneDelegate.swift"
    ];

    fileHelper?.rm(files, removeFromPbx: pbxPath);
  }

  _overrideInfoplist(String projectDir) {
    final info = resources?.infoplist();
    final old = projectDir + "/Info.plist";

    if (info != null) {
      fileHelper?.cp(info, old, true);
      ui?.echo("overwritten Info.plist", Color.green);
    } else {
      ui?.error("could not get Info.plist template");
    }
  }

  _overrideAppDelegate(String projectDir) {
    final info = resources?.appDelegate();
    final old = projectDir + "/AppDelegate.swift";

    if (info != null) {
      fileHelper?.cp(info, old, true);
      ui?.echo("overwritten AppDelegate.swift", Color.green);
    } else {
      ui?.error("could not get AppDelegate template");
    }
  }
}
