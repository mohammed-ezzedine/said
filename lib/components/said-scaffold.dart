import 'package:flutter/material.dart';

import './said-appbar.dart';
import './said-drawer.dart';

class SaidScaffold extends StatelessWidget {
  const SaidScaffold({ Key? key, required Widget this.body, bool this.hasParent = false }) : super(key: key);

  final Widget body;
  final bool hasParent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: saidAppbar(
          context: context,
          withArrowBack: hasParent
        ),
        body: body,
        endDrawer: SaidDrawer(),
    );
  }
}