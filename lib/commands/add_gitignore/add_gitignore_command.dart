import 'package:icli/commands/add_gitignore/domain/add_gitignore_usecase.dart';
import 'package:icli/core/icli_command.dart';
import 'package:icli/di/di.dart';

class AddGitignoreCommand extends IcliCommand {
  @override
  final name = "add-gitignore";

  @override
  final description = "Adds iOS gitignore to project";

  AddGitignoreUseCase? addGitignoreUseCase;

  AddGitignoreCommand({AddGitignoreUseCase? addGitignoreUseCase}) {
    this.addGitignoreUseCase =
        get<AddGitignoreUseCase>(object: addGitignoreUseCase);

    argParser.addFlag("f", defaultsTo: false);
  }

  @override
  Future<void> run() async {
    await addGitignoreUseCase?.run(argResults?["f"]);
  }
}
