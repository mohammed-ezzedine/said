import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-home-card.dart';
import 'package:said/pages/RegisterForFIT.dart';
import 'package:said/pages/about.dart';
import 'package:said/pages/community.dart';
import 'package:said/pages/prevention.dart';
import 'package:said/pages/risk.dart';
import 'package:said/pages/risks.dart';
import 'package:said/pages/screening-guidelines.dart';
import 'package:said/pages/screening.dart';
import 'package:said/pages/screeningTypes.dart';
import 'package:said/pages/stages.dart';
import 'package:said/pages/statistics.dart';
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
                      linkTo: About(),
                      padRight: gapPadding / 2,
                      backgroundColor: Color.fromARGB(255, 255, 199, 88),
                      textColor: Color.fromARGB(255, 2, 70, 126),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: SaidCard(
                      icon: "crc.png",
                      padLeft: gapPadding / 2,
                      textColor: Color.fromARGB(255, 2, 70, 126),
                      title: AppLocalizations.of(context)!.introduction,
                      linkTo: IntroductionWidget(),
                    ))
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                          backgroundColor: Color.fromARGB(255, 255, 199, 88),
                          textColor: Color.fromARGB(255, 2, 70, 126),
                          icon: "symptoms.png",
                          title: AppLocalizations.of(context)!.symptomsTitle,
                          linkTo: Symptoms()))
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                    textColor: Color.fromARGB(255, 2, 70, 126),
                    title: AppLocalizations.of(context)!.riskAmI,
                    linkTo: Risk(),
                    icon: "caution.png",
                  ))
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                          title: AppLocalizations.of(context)!.screeningTypes,
                          linkTo: ScreeningTypes(),
                          backgroundColor: Color.fromARGB(255, 255, 199, 88),
                          textColor: Color.fromARGB(255, 2, 70, 126),
                          icon: "types.png"))
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                          textColor: Color.fromARGB(255, 2, 70, 126),
                          title: AppLocalizations.of(context)!.stages,
                          linkTo: Stages(),
                          icon: "stages.png"))
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                    title: AppLocalizations.of(context)!.screeningImportance,
                    linkTo: Screening(),
                    icon: "important.png",
                    backgroundColor: Color.fromARGB(255, 255, 199, 88),
                    textColor: Color.fromARGB(255, 2, 70, 126),
                  )),
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                          textColor: Color.fromARGB(255, 2, 70, 126),
                          title:
                              AppLocalizations.of(context)!.screeningGuidelines,
                          linkTo: ScreeningGuidelines(),
                          icon: "guidelines.png"))
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                    title: "Prevention",
                    linkTo: Prevention(),
                    icon: "first-aid-kit.png",
                    backgroundColor: Color.fromARGB(255, 255, 199, 88),
                    textColor: Color.fromARGB(255, 2, 70, 126),
                  )),
                ]),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                          textColor: Color.fromARGB(255, 2, 70, 126),
                          title: AppLocalizations.of(context)!.stats,
                          linkTo: Statistics(),
                          icon: "stats.png"))
                ]),
                Row(
                  children: [
                    Expanded(
                        child: SaidCard(
                      backgroundColor: Color.fromARGB(255, 255, 199, 88),
                      textColor: Color.fromARGB(255, 2, 70, 126),
                      title: AppLocalizations.of(context)!.communityRole,
                      linkTo: Community(),
                      icon: "community.png",
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: SaidCard(
                          textColor: Color.fromARGB(255, 2, 70, 126),
                          title: AppLocalizations.of(context)!.test,
                          linkTo: RegisterForFIT(),
                          icon: "register.png"))
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
