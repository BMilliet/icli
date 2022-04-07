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

  Future<void> run(bool force) async {
    final ignore = resources?.gitignore();

    if (ignore != null) {
      await _copy(ignore, ".gitignore", force);
    } else {
      ui?.error("could not get gitignore template");
    }
  }

  Future<void> _copy(String from, String to, bool force) async {
    await fileHelper?.cp(from, to, force);
    ui?.echo("gitignore add", Color.cyan);
  }
}
