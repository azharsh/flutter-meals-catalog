import 'package:submission1_app/src/app.dart';
import 'package:submission1_app/src/app_config.dart';
import 'package:flutter/material.dart';

import 'package:submission1_app/src/resources/stringresource/display_strings_app2.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "MealsApp 2",
    appInternalId: 2,
    stringResource: StringsResourceApp2(),
    child: App(),
  );

  runApp(configuredApp);
}
