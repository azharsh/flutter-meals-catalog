import 'package:flutter/material.dart';
import '../src/ui/seafood_list.dart';
import '../src/ui/home_page.dart';
import 'package:submission1_app/src/app_config.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return _buildApp(config.appDisplayName);
  }

  Widget _buildApp(String appName) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
    );
  }
}
