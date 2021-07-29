import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({ Key? key }) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  Widget getCard(String text) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

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
                  child: Text(AppLocalizations.of(context)!.symptoms,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage('assets/img/symptoms.png'),
                  ),
                )
              ],
            )
            
          ),
          getCard(AppLocalizations.of(context)!.symptom1),
          getCard(AppLocalizations.of(context)!.symptom2),
          getCard(AppLocalizations.of(context)!.symptom3),
          getCard(AppLocalizations.of(context)!.symptom4),
          getCard(AppLocalizations.of(context)!.symptom5),
          getCard(AppLocalizations.of(context)!.symptom6),
        ],
      ),
    );
  }
}