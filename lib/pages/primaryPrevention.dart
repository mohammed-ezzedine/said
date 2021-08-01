import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-widget-card.dart';

class PrimaryPrevention extends StatefulWidget {
  const PrimaryPrevention({ Key? key }) : super(key: key);

  @override
  _PrimaryPreventionState createState() => _PrimaryPreventionState();
}

class _PrimaryPreventionState extends State<PrimaryPrevention> {
  @override
  Widget build(BuildContext context) {

    var pts = [
      AppLocalizations.of(context)!.primaryPreventionPt1,
      AppLocalizations.of(context)!.primaryPreventionPt2,
      AppLocalizations.of(context)!.primaryPreventionPt3,
      AppLocalizations.of(context)!.primaryPreventionPt4,
      AppLocalizations.of(context)!.primaryPreventionPt5
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidWidgetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(AppLocalizations.of(context)!.primaryPrevention,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              
                for (var pt in pts)
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("- " + pt,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 17,
                      )
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}