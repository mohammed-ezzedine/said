import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(AppLocalizations.of(context)!.saidNgo),
      ),
    );
  }
}