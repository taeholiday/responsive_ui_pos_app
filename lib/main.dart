import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/constants/app_themes/app_themes.dart';
import 'package:test_responsive_ui/provider/obscure_text_provider.dart';
import 'package:test_responsive_ui/screens/landing_page/landing_page.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ObscureTextProvider>(
            create: (context) => ObscureTextProvider()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('en', 'EN'), Locale('th', 'TH')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: AppThemes.lightTheme,
      title: "responsive ui",
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
