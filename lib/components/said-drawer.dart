import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SaidDrawer extends StatelessWidget {
  const SaidDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.settings),
            leading: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}