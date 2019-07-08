import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig(
      {this.appDisplayName,
      this.appInternalId,
      this.stringResource,
      Widget child})
      : super(child: child);

  final String appDisplayName;
  final int appInternalId;
  final StringResource stringResource;

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

abstract class StringResource {
  String APP_DESCRIPTION;
}
