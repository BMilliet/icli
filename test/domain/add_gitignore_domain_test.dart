import 'package:icli/commands/add_gitignore/domain/add_gitignore_usecase.dart';
import 'package:icli/utils/resources.dart';
import 'package:test/scaffolding.dart';
import 'package:test/expect.dart';

import '../mocks/file_helper_mock.dart';
import '../mocks/ui_mock.dart';

void main() {
  test("should add gitignore empty project", () {
    final mockUI = UIMock();
    final fileHelperMock = FileHelperMock();

    final useCase = AddGitignoreUseCase(ui: mockUI, fileHelper: fileHelperMock, resources: Resources());

    useCase.run(false);

    var writtenFile = <String, String>{};
    writtenFile[".gitignore"] = Resources().gitignore();

    expect(fileHelperMock.written, writtenFile);
    expect(mockUI.echos, ["added gitignore"]);
  });

  test("should avoid overwrite gitignore", () {
    final mockUI = UIMock();
    final fileHelperMock = FileHelperMock();
    fileHelperMock.existingPaths[".gitignore"] = true;

    final useCase = AddGitignoreUseCase(ui: mockUI, fileHelper: fileHelperMock, resources: Resources());

    useCase.run(false);

    var writtenFile = <String, String>{};

    expect(fileHelperMock.written, writtenFile);
    expect(mockUI.echos, ["Current dir already have gitignore file, to override it re-run the command with --f"]);
  });

  test("should overwrite gitignore", () {
    final mockUI = UIMock();
    final fileHelperMock = FileHelperMock();
    fileHelperMock.existingPaths[".gitignore"] = true;

    final useCase = AddGitignoreUseCase(ui: mockUI, fileHelper: fileHelperMock, resources: Resources());

    useCase.run(true);

    var writtenFile = <String, String>{};
    writtenFile[".gitignore"] = Resources().gitignore();

    expect(fileHelperMock.written, writtenFile);
    expect(mockUI.echos, ["added gitignore"]);
  });
}