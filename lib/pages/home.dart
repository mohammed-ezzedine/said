import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-home-card.dart';
import 'package:said/pages/community.dart';
import 'package:said/pages/prevention.dart';
import 'package:said/pages/risks.dart';
import 'package:said/pages/screening.dart';
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
      padding: EdgeInsets.only(left: 20, right: 20, top: 50),
      child: ListView (
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Image(
              image: AssetImage('assets/img/logo-dual.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: gapPadding),
            child: Row(
              children: [
                Expanded(
                  child: SaidCard(
                    title: AppLocalizations.of(context)!.introduction,
                    linkTo: IntroductionWidget(),
                    hasTabs: true,
                    tabsIcons: [
                      Text(AppLocalizations.of(context)!.general),
                      Text(AppLocalizations.of(context)!.symptomsTitle),
                      Text(AppLocalizations.of(context)!.riskFactorsTitle),
                    ],
                    tabsBodies: [
                      IntroductionWidget(),
                      Symptoms(),
                      RiskFactors(),
                    ],
                  )
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SaidCard(
                  title: AppLocalizations.of(context)!.screeningImportance,
                  linkTo: Screening(),
                  padRight: gapPadding / 2,
                  backgroundColor: Color(0xFFF59E0B),
                  textColor: Colors.white70,
                  icon: 'virus.png',
                )
              ),
              Expanded(
                child: SaidCard(
                  title: AppLocalizations.of(context)!.prevention + "\n",
                  linkTo: Prevention(),
                  padLeft: gapPadding / 2,
                  backgroundColor: Color(0xFFF59E0B),
                  textColor: Colors.white70,
                  icon: 'first-aid-kit.png',
                )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: gapPadding),
            child:  Row(
              children: [
                Expanded(
                  child: SaidCard(
                    title: AppLocalizations.of(context)!.communityRole,
                    linkTo: Community(),
                    padRight: gapPadding / 2,
                    icon: 'community.png',
                  )
                ),
                // Expanded(
                //   child: SaidCard(
                //     title: AppLocalizations.of(context)!.prevention,
                //     linkTo: Prevention(),
                //     padLeft: gapPadding / 2,
                //     backgroundColor: Color(0xFFF59E0B),
                //     textColor: Colors.white70,
                //     icon: 'first-aid-kit.png',
                //   )
                // )
              ],
            ),
          )
        ],
      )
    );
  }
}