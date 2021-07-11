import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/pages/screening-guidelines.dart';

class Screening extends StatelessWidget {

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

  Widget getCardWithImage(String text1, String imageSrc, {String text2 = ''}) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                text1,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image(
                  image: AssetImage(imageSrc),
                ),
              ),
              if (text2 != '')
                Text(
                  text2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView (
        children: [
          Card(
            elevation: 3,
            margin: EdgeInsetsDirectional.only(bottom: 10),
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(AppLocalizations.of(context)!.screeningImportance,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF59E0B),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ]
              )
            )
          ),
          getCard(AppLocalizations.of(context)!.screeningMsg1),
          getCard(AppLocalizations.of(context)!.screeningMsg2),
          getCardWithImage(
            AppLocalizations.of(context)!.screeningMsg3,
            'assets/img/screening.png',
            text2: AppLocalizations.of(context)!.screeningMsg4,
          ),
          getCardWithImage(
            AppLocalizations.of(context)!.screeningMsg5,
            'assets/img/screening2.png',
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Expanded(
              child: Card(
                elevation: 2,
                color: Color(0xFFF59E0B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
                      body: ScreeningGuidelines(),
                      hasParent: true,  
                    )));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.screeningGuidelines,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                ),
              )
            ),
          ),
        ]
      )
    );
  }
}