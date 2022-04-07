import 'package:icli/di/di.dart';
import 'package:icli/utils/ui.dart';

class StoryBoardRemoveUseCase {
  UI? ui;

  StoryBoardRemoveUseCase({UI? ui}) {
    this.ui = get<UI>(object: ui);
  }

  void run() {
    ui?.echo("remove storyboard", Color.green);
  }
}
