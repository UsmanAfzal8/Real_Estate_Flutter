import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'provider/app_theme.dart';
import 'provider/property_provider.dart';
import 'screen/front_screen.dart';
import 'screen/main_screen.dart';
import 'screen/upload_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider<PropertyProvider>.value(
          value: PropertyProvider(),
        ),
      ],
      child:
          Consumer<AppThemeProvider>(builder: (context, appThemePro, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Real Estate',
          themeMode: appThemePro.themeMode,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          home: const MainScreen(),
        );
      }),
    );
  }
}
