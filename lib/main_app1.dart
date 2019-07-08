import 'package:submission1_app/src/app.dart';
import 'package:submission1_app/src/app_config.dart';
import 'package:flutter/material.dart';
import 'package:submission1_app/src/resources/stringresource/display_strings_app1.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "MealsApp 1",
    appInternalId: 1,
    stringResource: StringsResourceApp1(),
    child: App(),
  );

  runApp(configuredApp);
}
