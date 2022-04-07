import 'package:icli/commands/storyboard_remove/domain/storyboard_remove_usecase.dart';
import 'package:icli/core/icli_command.dart';
import 'package:icli/di/di.dart';

class StoryBoardRemoveCommand extends IcliCommand {
  @override
  final name = "storyboard-remove";

  @override
  final description =
      "Removes initial storyboard structure for Xcode new project template";

  StoryBoardRemoveUseCase? storyBoardRemoveUseCase;

  StoryBoardRemoveCommand({StoryBoardRemoveUseCase? storyBoardRemoveUseCase}) {
    this.storyBoardRemoveUseCase =
        get<StoryBoardRemoveUseCase>(object: storyBoardRemoveUseCase);
  }

  @override
  void run() {
    storyBoardRemoveUseCase?.run();
  }
}
