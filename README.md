# Form_task

# Commands and scripts to obtain the files 
-dart pub global activate flutter_gen  -you need to run this only once
-dart run build_runner build --delete-conflicting-outputs
-dart run easy_localization:generate --source-dir assets/localization && dart run easy_localization:generate -S assets/localization -f keys -o locale_keys.g.dart
-fluttergen -c pubspec.yaml