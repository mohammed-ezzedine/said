import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidTextCard(
            title: AppLocalizations.of(context)!.storyTitle,
            text: AppLocalizations.of(context)!.storyBody,
          ),
          SaidTextCard(
            title: AppLocalizations.of(context)!.missionTitle,
            text: AppLocalizations.of(context)!.missionBody,
          ),
          SaidTextCard(
            title: AppLocalizations.of(context)!.visionTitle,
            text: AppLocalizations.of(context)!.visionBody,
          ),
          SaidTextCard(
            title: AppLocalizations.of(context)!.valuesTitle,
            text: AppLocalizations.of(context)!.valuesBody,
          ),
        ],
      ),
    );
  }
}
