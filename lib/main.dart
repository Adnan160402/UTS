import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/card_page.dart';
import 'presentation/pages/about_page.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/controllers/home_controller.dart';
import 'domain/usecases/navigate_to_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');

  void _changeLanguage(String languageCode) {
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Marketplace Kebutuhan Pangan',
      debugShowCheckedModeBanner: false,
      locale: _locale, // Set the current locale
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        Locale('id', ''), // Bahasa Indonesia
      ],
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(
            HomeController(NavigateToPageUseCase(NavigationService()))),
        '/card': (context) => CardPage(
            HomeController(NavigateToPageUseCase(NavigationService()))),
        '/about': (context) => AboutPage(
            HomeController(NavigateToPageUseCase(NavigationService()))),
      },
    );
  }
}
