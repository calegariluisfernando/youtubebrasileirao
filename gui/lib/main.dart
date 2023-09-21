import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubebrasileirao/screens/jogos_time_screen.dart';

import 'notifiers/theme_notifier.dart';
import 'notifiers/time_notifier.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => TimeNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) =>  MaterialApp(
        title: 'Brasileirão',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
        routes: {
          '/': (context) => HomeScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
