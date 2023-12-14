import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/app_provider.dart';
import 'package:flutter_application_3/providers/counter_provider.dart';
import 'package:flutter_application_3/styles/theme_style.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<AppProvider>().themeMode,
        title: 'flutter',
        home: const MyHomePage(title: 'Category'));
  }
}
