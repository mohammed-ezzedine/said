import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-home-card.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';

class Community extends StatefulWidget {
  const Community({ Key? key }) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {

    var message2Pts = [
      AppLocalizations.of(context)!.communityM2pt1,
      AppLocalizations.of(context)!.communityM2pt2,
      AppLocalizations.of(context)!.communityM2pt3,
      AppLocalizations.of(context)!.communityM2pt4,
      AppLocalizations.of(context)!.communityM2pt5,
      AppLocalizations.of(context)!.communityM2pt6,
      AppLocalizations.of(context)!.communityM2pt7
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidWidgetCard(
            child: Column(
              children: [
                SaidText(
                  padding: EdgeInsets.only(bottom: 20),
                  text: AppLocalizations.of(context)!.communityM1,
                ),
                Image(
                  image: AssetImage("assets/img/community.jpg"),
                ),
              ],
            ),
          ),
          SaidWidgetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SaidTitle(
                  padding: EdgeInsets.only(bottom: 20),
                  text: AppLocalizations.of(context)!.communityM2title,
                ),
                for (var pt in message2Pts)
                  SaidText(
                    padding: EdgeInsets.only(bottom: 15),
                    text: pt,
                  ),
                
              ],
            ),
          ),
          SaidWidgetCard(
            child: SaidText(
              color: Colors.purple,
              text: AppLocalizations.of(context)!.communityM3,
              padding: EdgeInsets.only(top: 10),
            ),
          )
        ],
      )
    );
  }
}