import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:icli/commands/add_gitignore/add_gitignore_command.dart';
import 'package:icli/commands/storyboard_remove/storyboard_remove_command.dart';
import 'package:icli/di/di.dart';

Future<void> run(List<String> args) async {
  var runner = CommandRunner("icli", "iOS command line tool")
    ..addCommand(get<StoryBoardRemoveCommand>())
    ..addCommand(get<AddGitignoreCommand>());

  await runner.run(args).catchError((e) {
    print("icli: command runner failed\n$e");
    exit(1);
  });
}
