import 'dart:io';

const List<String> iconNumbering = ['one', 'two', '3', '4', '5', '6'];

/// Method capitalizes the first word of a paragraph.
String toTitleCase(String str) => str
    .toLowerCase()
    .split(' ')
    .map((word) =>
        word.substring(0, 1).toUpperCase() + word.substring(1, word.length))
    .join(' ');

/// Method generated the string that will be show within dartpad_metadata.yaml.
void generateDartpadMetadata(String fileDirectory, String fileName) {
  File(fileDirectory + '/dartpad_metadata.yaml').writeAsString(
      'name: ${toTitleCase(fileName.replaceAll('_', ' ')).replaceAll('Demo.dart', '')}Demonstration\n'
      'mode: flutter\n'
      'files:\n'
      '  - name: main.dart\n');
}

/// Method generates list of classes that will be the executable within the
/// runApp of each dart file.
List<String> generateExecutables() {
  /// Demos file is where all the classes are being generated.
  var demosPage = File('lib/data/demos.dart').readAsStringSync();
  RegExp exp = RegExp(r'buildRoute: \((context|_)\) =>\s*\w*\(\s*.*\s*\),');
  Iterable<RegExpMatch> matches = exp.allMatches(demosPage);

  List<String> executableClasses = List<String>();
  matches.toList().forEach((element) {
    executableClasses.add(element
        .group(0)
        .replaceAll(RegExp(r'buildRoute: \((context|_)\) =>\s*'), '')
        .replaceAll(RegExp(r'\s*'), ''));
  });

  return executableClasses;
}

/// Generates the executable for the specific file.
String generateExecutableClass(List<String> executables, String fileContent) =>
    executables.firstWhere(
        (element) => fileContent
            .contains(' ' + element.replaceAll(RegExp(r'\(\s*.*'), '')),
        orElse: () => null);

/// Generates the executable list for that specific component.
List<String> generateExecutablesForClass(
        List<String> executables, String fileContent) =>
    executables
        .where((element) => fileContent
            .contains(' ' + element.replaceAll(RegExp(r'\(\s*.*'), '')))
        .toList();

/// Replaces GalleryLocalizations Strings with English equivalent.
String replaceGalleryLocalizations(String fileContent) {
//  RegExp galleryLocalizationRegExp = RegExp(r'GalleryLocalizations.of\(context\)\.\w*(\(\s*.*\s*\))?,?');
//  RegExp galleryLocalizationRegExp = RegExp(r'GalleryLocalizations.of\(context\)\.\w*(\(\s*.*\s*\))?,?');
  RegExp galleryLocalizationRegExp =
      RegExp(r'GalleryLocalizations.of\(context\)\.\w*');
  List<String> englishEquivalent = List<String>();
  Iterable<RegExpMatch> matches =
      galleryLocalizationRegExp.allMatches(fileContent);
  matches.toList().forEach((element) {
    englishEquivalent.add(element
        .group(0)
        .replaceAll('GalleryLocalizations.of\(context\)\.', '')
        .replaceAll(',', ''));
  });

//  String variableInGalleryLocalization;
  String translationFile = File('lib/l10n/intl_en_US.xml').readAsStringSync();
  englishEquivalent.forEach((element) {
//    variableInGalleryLocalization = element.replaceAll('GalleryLocalizations.of\(context\)\.', '');
//    print(variableInGalleryLocalization);

    RegExp englishLocalizationsRegExp =
        RegExp(element + r'\"s*\s*.*\s*>[\w\s]*');
    String match = englishLocalizationsRegExp
        .firstMatch(translationFile)
        .group(0)
        .replaceFirst(RegExp(element + r'\"s*\s*.*\s*>'), '');

    print('GalleryLocalizations.of\(context\)\.' + element);
    print(
        fileContent.contains('GalleryLocalizations.of\(context\)\.' + element));
    fileContent = fileContent.replaceFirst(
        'GalleryLocalizations.of\(context\)\.' + element, '\'$match\'');
  });

  return fileContent;
}

/// Update main file for each directory with necessary updates to make the dart
/// file an actual executable.
void updateMainFile(String fileContent, File file,
    List<String> executablesForClass, String fileName) {
  final materialImport =
      fileContent.contains(RegExp('import \'package:flutter/material.dart\';'))
          ? ''
          : 'import \'package:flutter/material.dart\';\n';

  fileContent = replaceGalleryLocalizations(fileContent);

  if (executablesForClass.length == 1) {
    file.writeAsString(
      materialImport +
          fileContent +
          'void main() {\n'
              '\trunApp(\n'
              '\t\tMaterialApp(\n'
              '\t\t\tdebugShowCheckedModeBanner: false,\n'
              '\t\t\thome: ${executablesForClass.first}\n'
              '\t\t),\n'
              '\t);\n'
              '}\n',
    );
  } else {
    String appBarActions = '';
    for (int counter = 0; counter < executablesForClass.length; counter++) {
      appBarActions += '\t\t\t\t\t\tIconButton(\n'
          '\t\t\t\t\t\t\ticon: const Icon(Icons.looks_${iconNumbering[counter]}),\n'
          '\t\t\t\t\t\t\tonPressed: () {\n'
          '\t\t\t\t\t\t\t\tsetState(() {\n'
          '\t\t\t\t\t\t\t\t\t_body = ${executablesForClass[counter].replaceAll('),', ');')}\n'
          '\t\t\t\t\t\t\t\t});\n'
          '\t\t\t\t\t\t\t},\n'
          '\t\t\t\t\t\t),\n';
    }

    file.writeAsString('$materialImport$fileContent'
        'void main() => runApp(Example());\n\n'
        'class Example extends StatefulWidget {\n'
        '\t _ExampleState createState() => _ExampleState();\n'
        '}\n\n'
        'class _ExampleState extends State<Example> {\n'
        '\tWidget _body;\n\n'
        '\tstatic const String _title = \'${toTitleCase(fileName.replaceAll('_', ' ')).replaceAll('Demo.dart', '')}Demonstration\';\n\n'
        '\t@override\n'
        '\tvoid initState() {\n'
        '\t\tsuper.initState();\n'
        '\t\t_body = ${executablesForClass.first.replaceAll('),', ');')}\n'
        '\t}\n\n'
        '\t@override\n'
        '\tWidget build(BuildContext context) {\n'
        '\t\treturn MaterialApp(\n'
        '\t\t\ttitle: _title,\n'
        '\t\t\thome: Scaffold(\n'
        '\t\t\t\tappBar: AppBar(\n'
        '\t\t\t\t\ttitle: const Text(_title),\n'
        '\t\t\t\t\tactions: <Widget>[\n'
        '$appBarActions'
        '\t\t\t\t\t],\n'
        '\t\t\t\t),\n'
        '\t\t\t\tbody: _body,\n'
        '\t\t\t),\n'
        '\t\t);\n'
        '\t}\n'
        '}\n');
  }
}

Future<Null> createDartpadFolder(String from, String to) async {
  List<String> executables = generateExecutables();

  await for (final file in Directory(from).list(recursive: true)) {
    final copyTo = (to + file.path.toString()).replaceAll(from, '');

    if (file is Directory) {
      await Directory(copyTo).create(recursive: true);
    } else {
      final fileName = file.path.split('/').last;
      final fileDirectory = copyTo.replaceAll('.dart', '');

      /// Edge case for reference.transformations_demo
      if (file.path.contains(RegExp(r'transformations_demo_.*'))) {
        await Directory(to + 'reference/transformations_demo').create();
        File(file.path)
            .copySync(to + 'reference/transformations_demo/' + fileName);
      } else {
        // Generate dartpad_metadata for each file
        generateDartpadMetadata(fileDirectory, fileName);

        await Directory(fileDirectory).create(recursive: true);
        await File(file.path).copy(fileDirectory + '/main.dart').then((file) {
          var fileContent = file.readAsStringSync();
          final executablesForClass =
              generateExecutablesForClass(executables, fileContent);
          updateMainFile(fileContent, file, executablesForClass, fileName);
        });
      }
    }
  }
}

void main(List<String> arguments) {
  Directory('dartpad').create();
  createDartpadFolder('lib/demos/', 'dartpad/');
}
