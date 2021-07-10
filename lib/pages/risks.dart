import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RiskFactors extends StatelessWidget {
  const RiskFactors({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var highRiskMessages = [
      AppLocalizations.of(context)!.riskAverageMsg1,
      AppLocalizations.of(context)!.riskAverageMsg2,
      AppLocalizations.of(context)!.riskAverageMsg3,
      AppLocalizations.of(context)!.riskAverageMsg4,
      AppLocalizations.of(context)!.riskAverageMsg5,
      AppLocalizations.of(context)!.riskAverageMsg6
    ];

    var averageRiskMessages = [
      AppLocalizations.of(context)!.riskHighMsg1,
      AppLocalizations.of(context)!.riskHighMsg2,
      AppLocalizations.of(context)!.riskHighMsg3
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(AppLocalizations.of(context)!.riskFactors,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    AppLocalizations.of(context)!.riskFactorsIntro,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                )
              ],
            )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            AppLocalizations.of(context)!.riskAverage,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.riskAverageIntro,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                          ),
                        ),
                        for (var message in highRiskMessages)
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              '\u2022 ' + message,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            AppLocalizations.of(context)!.riskHigh,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.riskHighIntro,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                          ),
                        ),
                        for (var message in averageRiskMessages)
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              '\u2022 ' + message,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}