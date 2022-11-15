import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app_theme.dart';
import 'screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeProvider>.value(
          value: AppThemeProvider(),
        ),
      ],
      child:
          Consumer<AppThemeProvider>(builder: (context, appThemePro, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: appThemePro.themeMode,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          home: const MianScreen(),
        );
      }),
    );
  }
}
