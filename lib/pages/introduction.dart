import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/pages/stages.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var messages = [ 
      AppLocalizations.of(context)!.key12, 
      AppLocalizations.of(context)!.key13, 
      AppLocalizations.of(context)!.key14, 
      AppLocalizations.of(context)!.key15
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView (
        children: [
          Card(
            elevation: 3,
            margin: EdgeInsetsDirectional.only(bottom: 20),
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      AppLocalizations.of(context)!.key11,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Image(image: AssetImage('assets/img/key-message-1.jpg')),
                  for (String msg in messages)
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\u2022 ' + msg,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                ],
              ),
            )
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
                      body: Stages(),
                      hasParent: true,  
                    )));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.stages,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
