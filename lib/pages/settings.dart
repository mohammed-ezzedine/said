import 'package:flutter/material.dart';
import 'package:said/components/said-language.dart';

class Settings extends StatelessWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          LanguageSettings()
        ],
      )
    );
  }
}