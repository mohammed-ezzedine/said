import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pages/home.dart';
import 'components/said-scaffold.dart';
import 'styles/theme.dart';

void main() => runApp(SAIDApp());

class SAIDApp extends StatefulWidget {
  const SAIDApp({ Key? key}) : super(key: key);

  @override
  _SAIDAppState createState() => _SAIDAppState();

  static _SAIDAppState of(BuildContext context) => context.findAncestorStateOfType<_SAIDAppState>()!;
}

class _SAIDAppState extends State<SAIDApp> {
  Locale _locale = Locale.fromSubtags(languageCode: 'en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SAID NGO",
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', ''),
        const Locale('en', ''),
      ],
      home: SaidScaffold(body: Home()),
      theme: appTheme(),
    );
  }
}