import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Stages extends StatelessWidget {
  const Stages({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var stages = [
      AppLocalizations.of(context)!.stage0,
      AppLocalizations.of(context)!.stage1,
      AppLocalizations.of(context)!.stage2,
      AppLocalizations.of(context)!.stage3,
      AppLocalizations.of(context)!.stage4,
    ];

    return Timeline(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(AppLocalizations.of(context)!.stages,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.stagesIntro,
                  style: TextStyle(
                    fontSize: 17
                  ),
                  textAlign: TextAlign.justify
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Image(
                    image: AssetImage('assets/img/stages.png'),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.stagesIntro2,
                  style: TextStyle(
                    fontSize: 17
                  ),
                  textAlign: TextAlign.justify
                ),
              ],
            ),
          ),
        ),
        for (int i = 0; i < stages.length; i++)
          TimelineTile(
            node: TimelineNode(
              indicator: DotIndicator(
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              startConnector: SolidLineConnector(
                color: Colors.lightBlue
              ),
              endConnector: SolidLineConnector(
                color: Colors.lightBlue
                // color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
            nodeAlign: TimelineNodeAlign.start,
            crossAxisExtent: 300,
            contents: Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          AppLocalizations.of(context)!.stage + ' $i:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFF59E0B)
                          ),
                        ),
                      ),
                      Text(
                        stages[i],
                        style: TextStyle(
                          fontSize: 17
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )
                ),
              ),
            ),
          )
      ],
    );
  }
}