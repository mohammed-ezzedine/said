import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    double gapPadding = 5;

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Card(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  AppLocalizations.of(context)!.symptoms,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
          SaidTextCard(text: AppLocalizations.of(context)!.symptom1),
          SaidTextCard(text: AppLocalizations.of(context)!.symptom2),
          SaidTextCard(text: AppLocalizations.of(context)!.symptom3),
          SaidTextCard(text: AppLocalizations.of(context)!.symptom4),
          SaidTextCard(text: AppLocalizations.of(context)!.symptom5),
          SaidTextCard(text: AppLocalizations.of(context)!.symptom6),
        ],
      ),
    );
  }
}
