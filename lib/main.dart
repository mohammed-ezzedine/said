import 'package:flutter/material.dart';

import 'pages/introduction.dart';
import 'styles/theme.dart';

void main() => runApp(SAIDApp());

class SAIDApp extends StatelessWidget {
  const SAIDApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      home: Scaffold(
        appBar: AppBar(
          title: Image(
            image: AssetImage(
              'assets/img/logo-white.png',
            ),
            // fit: BoxFit.fitWidth,
            height: 50,
          )
        ),
        body: IntroductionWidget(),
      ),
      theme: appTheme(),
    );
  }
}