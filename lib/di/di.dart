import 'package:get_it/get_it.dart';
import 'package:icli/commands/add_gitignore/add_gitignore_command.dart';
import 'package:icli/commands/add_gitignore/domain/add_gitignore_usecase.dart';
import 'package:icli/commands/storyboard_remove/domain/storyboard_remove_usecase.dart';
import 'package:icli/commands/storyboard_remove/storyboard_remove_command.dart';
import 'package:icli/utils/file_helper.dart';
import 'package:icli/utils/resources.dart';
import 'package:icli/utils/ui.dart';

T get<T extends Object>({T? object}) {
  return object ?? GetIt.I.get<T>();
}

injectInstances() {
  // Commands
  GetIt.I.registerLazySingleton(() => StoryBoardRemoveCommand());
  GetIt.I.registerLazySingleton(() => AddGitignoreCommand());
  // UseCases
  GetIt.I.registerLazySingleton(() => StoryBoardRemoveUseCase());
  GetIt.I.registerLazySingleton(() => AddGitignoreUseCase());
  // Utils
  GetIt.I.registerLazySingleton(() => UI());
  GetIt.I.registerLazySingleton(() => FileHelper());
  GetIt.I.registerLazySingleton(() => Resources());
}
