import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:front_end_flutter/ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialApp is a class in the Flutter framework that provides a default implementation of Material Design
    return const MaterialApp(
        title: 'Click Me App',

        // Adding Internationlization
        //The elements of the localizationsDelegates list are factories that produce collections of localized values.
        localizationsDelegates: [
          AppLocalizations.delegate,
          //provides localized strings and other values for the Material Components library
          // the Material package should now be correctly localized in one of the 115 supported locales.
          GlobalMaterialLocalizations.delegate,
          // defines the default text direction,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
          Locale('ar'), // Arabic
        ],
        home: HomePage());
  }
}
