import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pages/introduction.dart';
import 'styles/theme.dart';
import 'components/said-appbar.dart';
import 'components/said-drawer.dart';

void main() => runApp(SAIDApp());

class SAIDApp extends StatelessWidget {
  const SAIDApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
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
      home: Scaffold(
        appBar: saidAppbar(),
        body: IntroductionWidget(),
        drawer: SaidDrawer(),
      ),
      theme: appTheme(),
    );
  }
}