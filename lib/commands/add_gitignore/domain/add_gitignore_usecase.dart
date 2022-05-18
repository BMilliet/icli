import 'package:icli/di/di.dart';
import 'package:icli/utils/file_helper.dart';
import 'package:icli/utils/resources.dart';
import 'package:icli/utils/ui.dart';

class AddGitignoreUseCase {
  UI? ui;
  FileHelper? fileHelper;
  Resources? resources;

  AddGitignoreUseCase({UI? ui, FileHelper? fileHelper, Resources? resources}) {
    this.ui = get<UI>(object: ui);
    this.fileHelper = get<FileHelper>(object: fileHelper);
    this.resources = get<Resources>(object: resources);
  }

  run(bool force) {
    final ignore = resources?.gitignore();

    if (ignore != null) {
      _write('.gitignore', ignore, force);
    } else {
      ui?.error("Could not get gitignore template or class");
    }
  }

  _write(String to, String content, bool force) {
    if ((fileHelper?.fileExists(to) ?? true) && !force) {
      ui?.echo("Current dir already have gitignore file, to override it re-run the command with --f", Color.yellow);
      return;
    }

    fileHelper?.writeFile(to, content);
    ui?.echo("added gitignore", Color.cyan);
  }
}
