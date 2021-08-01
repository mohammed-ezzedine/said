import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-title.dart';

class ScreeningTypes extends StatefulWidget {
  const ScreeningTypes({ Key? key }) : super(key: key);

  @override
  _ScreeningTypesState createState() => _ScreeningTypesState();
}

class _ScreeningTypesState extends State<ScreeningTypes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidTitle(
            padding: EdgeInsets.only(bottom: 20),
            text: AppLocalizations.of(context)!.screeningTypesTitle,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Image(
              image: AssetImage("assets/img/risk.png"),
            ),
          ),
          SaidTextCard(
            title: AppLocalizations.of(context)!.screeningTypesAverageTitle,
            text: AppLocalizations.of(context)!.screeningTypesAverageText,
          ),
          SaidTextCard(
            title: AppLocalizations.of(context)!.screeningTypesHighTitle,
            text: AppLocalizations.of(context)!.screeningTypesHighText,
          )
        ],
      ),
    );
  }
}