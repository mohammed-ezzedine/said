import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';

class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

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
          SaidWidgetCard(
            child: Column(
              children: [
                SaidTitle(
                  padding: EdgeInsets.only(bottom: 20),
                  text: AppLocalizations.of(context)!.contactTitle,
                ),
                Table(
                  
                  children: [
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: AppLocalizations.of(context)!.contactByEmail),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: "hananimer@saidcrc.org")
                        )

                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: AppLocalizations.of(context)!.contactPhone),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: "+9613458476 +96181936779"),
                        ),
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: AppLocalizations.of(context)!.contactInstagram),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: "saidngo"),
                        ),
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: AppLocalizations.of(context)!.contactFacebook),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: "SAID NGO"),
                        ),
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: AppLocalizations.of(context)!.contactWebsite),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: "www.saidcrc.org"),
                        ),
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: AppLocalizations.of(context)!.contactLinkedIn),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SaidText(text: "SAID NGO"),
                        ),
                      ]
                    ),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}