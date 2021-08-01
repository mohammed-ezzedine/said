import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-button.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-widget-card.dart';
import 'package:said/pages/primaryPrevention.dart';
import 'package:said/pages/statistics.dart';
import 'package:said/pages/tertiaryPrevention.dart';

class Prevention extends StatefulWidget {
  const Prevention({ Key? key }) : super(key: key);

  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  @override
  Widget build(BuildContext context) {

    var pts = [
      AppLocalizations.of(context)!.preventionPt1,
      AppLocalizations.of(context)!.preventionPt2,
      AppLocalizations.of(context)!.preventionPt3,
      AppLocalizations.of(context)!.preventionPt4,
      AppLocalizations.of(context)!.preventionPt5,
      AppLocalizations.of(context)!.preventionPt6,
      AppLocalizations.of(context)!.preventionPt7,
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView (
        children: [
          SaidButton(
            padding: EdgeInsets.only(bottom: 20),
            child: Statistics(), 
            text: AppLocalizations.of(context)!.stats
          ),
          SaidTextCard(
            title: AppLocalizations.of(context)!.preventionQ,
            text: AppLocalizations.of(context)!.preventionA,
          ),
          SaidWidgetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    AppLocalizations.of(context)!.preventionTitle,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                for (var pt in pts)
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "- " + pt,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SaidButton(
            padding: EdgeInsets.only(top: 10),
            text: AppLocalizations.of(context)!.primaryPrevention,
            child: PrimaryPrevention(),
          ),
          SaidButton(
            padding: EdgeInsets.symmetric(vertical: 5),
            text: AppLocalizations.of(context)!.tertiaryPrevention,
            child: TertiaryPrevention(),
          ),
        ]
      )
    );
  }
}