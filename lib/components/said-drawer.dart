import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-internel-scaffold.dart';
import 'package:said/pages/settings.dart';

class SaidDrawer extends StatefulWidget {
  const SaidDrawer({ Key? key }) : super(key: key);

  @override
  _SaidDrawerState createState() => _SaidDrawerState();
}

class _SaidDrawerState extends State<SaidDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.settings),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SaidInternalScaffold(body: Settings())));
            }
          )
        ],
      ),
    );
  }
}