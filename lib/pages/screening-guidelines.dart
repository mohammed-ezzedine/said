import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-button.dart';
import 'package:said/pages/screeningPledging.dart';

class ScreeningGuidelines extends StatefulWidget {
  const ScreeningGuidelines({Key? key}) : super(key: key);

  @override
  _ScreeningGuidelinesState createState() => _ScreeningGuidelinesState();
}

class _ScreeningGuidelinesState extends State<ScreeningGuidelines> {
  Widget getCard(String text) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget getText(String text) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 17,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          Card(
              elevation: 3,
              margin: EdgeInsetsDirectional.only(bottom: 10),
              child: Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Text(
                  AppLocalizations.of(context)!.screeningGuidelines,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Card(
                elevation: 3,
                margin: EdgeInsetsDirectional.only(bottom: 10),
                child: Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            AppLocalizations.of(context)!.screeningGHighRisk,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        getText(
                            AppLocalizations.of(context)!.screeningGHighRisk1),
                        getText(
                            AppLocalizations.of(context)!.screeningGHighRisk2),
                        getText(
                            AppLocalizations.of(context)!.screeningGHighRisk3),
                        getText(
                            AppLocalizations.of(context)!.screeningGHighRisk4),
                      ],
                    ))),
          ),
          Card(
              elevation: 3,
              margin: EdgeInsetsDirectional.only(bottom: 10),
              child: Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          AppLocalizations.of(context)!.screeningGLowRisk,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      getText(AppLocalizations.of(context)!.screeningGLowRisk1),
                    ],
                  ))),
          /*  SaidButton(
            child: ScreeningPledging(),
            text: AppLocalizations.of(context)!.screeningPledge,
          )*/
        ]));
  }
}
