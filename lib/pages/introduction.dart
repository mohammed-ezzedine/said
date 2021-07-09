import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Card(
              margin: EdgeInsetsDirectional.only(bottom: 20),
              child: Padding(
                padding: EdgeInsetsDirectional.all(10),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.key11,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Image(image: AssetImage('assets/img/key-message-1.jpg'))
                  ],
                ),
              )
            );
          }

          return Card(
            margin: EdgeInsetsDirectional.only(bottom: 20),
            child: Padding(
              padding: EdgeInsetsDirectional.all(10),
              child: Text(
                messages[index-1],
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ) 
          );
        },
      )
    );
  }
}
