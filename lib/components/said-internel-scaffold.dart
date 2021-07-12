import 'package:flutter/material.dart';

import './said-appbar.dart';
import './said-drawer.dart';

class SaidInternalScaffold extends StatelessWidget {
  const SaidInternalScaffold({  Key? key, required Widget this.body }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: saidAppbar(
        context: context,
        withArrowBack: true
      ),
      body: body
    );
  }
}