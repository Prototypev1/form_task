# Form_task
- built with flutter 3.35.3, to build run the app and obtain the generated and codegen files run the commands presented below one by one 

# Commands and scripts to obtain the files 
-dart pub global activate flutter_gen  -you need to run this only once
-dart run build_runner build --delete-conflicting-outputs
-dart run easy_localization:generate --source-dir assets/localization && dart run easy_localization:generate -S assets/localization -f keys -o locale_keys.g.dart
-fluttergen -c pubspec.yaml

# how to simulate different response codes:
 - this will be done by exculding some/multiple fields - nothing in the forms is required as a field bsacially so leaving fields empty should return some error messages - 
 - leaving out only form name/label/naziv - returns 400
 - leaving out activity dropdown emtpy - returns 401 unauthorized
 - leaving out location string - returns 500 server error
 - leaving everything empty will return 400 too
 - filling in everything returns saved