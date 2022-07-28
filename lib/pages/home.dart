import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-home-card.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/pages/about.dart';
import 'package:said/pages/community.dart';
import 'package:said/pages/prevention.dart';
import 'package:said/pages/risk.dart';
import 'package:said/pages/risks.dart';
import 'package:said/pages/screening.dart';
import 'package:said/pages/stages.dart';
import 'package:said/pages/symptoms.dart';

import './introduction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double cardPadding = 20;

  final double gapPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SaidCard(
                      icon: "about.png",
                      title: AppLocalizations.of(context)!.about,
                      linkTo: Screening(),
                      padRight: gapPadding / 2,
                      backgroundColor: Color(0xFFF59E0B),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: SaidCard(
                      icon: "crc.png",
                      padLeft: gapPadding / 2,
                      title: AppLocalizations.of(context)!.introduction,
                      linkTo: IntroductionWidget(),
                      hasTabs: true,
                      tabsIcons: [
                        Text(AppLocalizations.of(context)!.general),
                        Text(AppLocalizations.of(context)!.symptomsTitle),
                        Text(AppLocalizations.of(context)!.riskFactorsTitle),
                        Text(AppLocalizations.of(context)!.stages)
                      ],
                      tabsBodies: [
                        IntroductionWidget(),
                        Symptoms(),
                        RiskFactors(),
                        Stages()
                      ],
                    ))
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                    title: AppLocalizations.of(context)!.screeningImportance,
                    linkTo: Screening(),
                    icon: "important.png",
                    backgroundColor: Color(0xFFF59E0B),
                    textColor: Color.fromARGB(255, 255, 255, 255),
                  )),
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                    title: "Prevention",
                    linkTo: Prevention(),
                    icon: "first-aid-kit.png",
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  )),
                ]),
                Row(
                  children: [
                    Expanded(
                        child: SaidCard(
                      backgroundColor: Color(0xFFF59E0B),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      title: AppLocalizations.of(context)!.communityRole,
                      linkTo: Community(),
                      icon: "community.png",
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                    title: AppLocalizations.of(context)!.riskAmI,
                    linkTo: Risk(),
                    icon: "caution.png",
                  ))
                ]),
              ],
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 20),
            //   child: Text(
            //     AppLocalizations.of(context)!.greeting,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Color(0xFF1E3A8A),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
