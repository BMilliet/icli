import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:icli/commands/storyboard_remove/storyboard_remove_command.dart';
import 'package:icli/di/di.dart';

void run(List<String> args) {
  var runner = CommandRunner("icli", "iOS command line tool")
    ..addCommand(get<StoryBoardRemoveCommand>());

  runner.run(args).catchError((e) {
    print("icli: command runner failed\n$e");
    exit(1);
  });
}
