import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/app_provider.dart';
import 'package:flutter_application_3/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
    ),
  ], child: const App()));
}
