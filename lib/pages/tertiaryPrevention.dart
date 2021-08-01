import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';

class TertiaryPrevention extends StatefulWidget {
  const TertiaryPrevention({ Key? key }) : super(key: key);

  @override
  _TertiaryPreventionState createState() => _TertiaryPreventionState();
}

class _TertiaryPreventionState extends State<TertiaryPrevention> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidWidgetCard(
            child: Column(
              children: [
                SaidTitle(text: AppLocalizations.of(context)!.tertiaryPrevention),
                SaidText(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  text: AppLocalizations.of(context)!.tertiaryPreventionMsg
                ),
                Image(image: AssetImage('assets/img/tertiary-prevention.png'))
              ],
            ),
          )
        ],
      )
    );
  }
}