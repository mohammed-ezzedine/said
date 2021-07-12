import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Prevention extends StatelessWidget {
  const Prevention({ Key? key }) : super(key: key);

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
                    child: Text(AppLocalizations.of(context)!.tertiaryPrevention,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF59E0B),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.tertiaryPreventionMsg,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ]
              )
            )
          ),
        ]
      )
    );
  }
}