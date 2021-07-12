import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/main.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({ Key? key }) : super(key: key);

  @override
  _LanguageSettingsState createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  String currentLanguage = 'en';

  @override
  void initState() {
    // currentLanguage = AppLocalizations.of(context)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      currentLanguage = AppLocalizations.of(context)!.localeName;
    });

    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                AppLocalizations.of(context)!.languageChoose,
                style: TextStyle(
                  fontSize: 17
                ),
              ),
            ),
            DropdownButton<String>(
              value: currentLanguage,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  currentLanguage = newValue!;
                  SAIDApp.of(context).setLocale(Locale.fromSubtags(languageCode: currentLanguage));
                });
              },
              items: <String>['en', 'ar' ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}