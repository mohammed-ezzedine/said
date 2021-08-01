import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';

class Statistics extends StatefulWidget {
  const Statistics({ Key? key }) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {

    var messages = [
      AppLocalizations.of(context)!.stat1,
      AppLocalizations.of(context)!.stat2,
      AppLocalizations.of(context)!.stat3,
      AppLocalizations.of(context)!.stat4,
      AppLocalizations.of(context)!.stat5
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, i) =>
          SaidTextCard(
            text: messages[i],
          ),
      ),
    );
  }
}