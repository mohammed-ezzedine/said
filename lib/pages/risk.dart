import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-button.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';
import 'package:said/pages/screeningTypes.dart';

class Risk extends StatefulWidget {
  const Risk({Key? key}) : super(key: key);

  @override
  _RiskState createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  @override
  Widget build(BuildContext context) {
    var message1Pts = [
      AppLocalizations.of(context)!.riskM1pt1,
      AppLocalizations.of(context)!.riskM1pt2,
      AppLocalizations.of(context)!.riskM1pt2A,
      AppLocalizations.of(context)!.riskM1pt2B,
      AppLocalizations.of(context)!.riskM1pt3,
      AppLocalizations.of(context)!.riskM1pt4
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidWidgetCard(
            child: Column(
              children: [
                SaidTitle(
                  padding: EdgeInsets.only(bottom: 20),
                  text: AppLocalizations.of(context)!.riskM1,
                ),
                for (var pt in message1Pts)
                  SaidText(
                    padding: EdgeInsets.only(bottom: 15),
                    text: pt,
                  )
              ],
            ),
          ),
          SaidWidgetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SaidText(
                  padding: EdgeInsets.only(bottom: 15),
                  text: AppLocalizations.of(context)!.riskM2pt1,
                ),
                SaidText(
                  padding: EdgeInsets.only(bottom: 15),
                  text: AppLocalizations.of(context)!.riskM2pt2,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
