import 'package:get_it/get_it.dart';
import 'package:icli/commands/storyboard_remove/domain/storyboard_remove_usecase.dart';
import 'package:icli/commands/storyboard_remove/storyboard_remove_command.dart';
import 'package:icli/utils/ui.dart';

T get<T extends Object>({T? object}) {
  return object ?? GetIt.I.get<T>();
}

injectInstances() {
  GetIt.I.registerLazySingleton(() => StoryBoardRemoveCommand());
  GetIt.I.registerLazySingleton(() => StoryBoardRemoveUseCase());
  GetIt.I.registerLazySingleton(() => UI());
}
