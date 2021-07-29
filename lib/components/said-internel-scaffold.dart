import 'package:flutter/material.dart';

import './said-appbar.dart';
import './said-drawer.dart';

class SaidInternalScaffold extends StatefulWidget {
  const SaidInternalScaffold({  Key? key, required Widget this.body }) : super(key: key);

  final Widget body;

  @override
  _SaidInternalScaffoldState createState() => _SaidInternalScaffoldState();
}

class _SaidInternalScaffoldState extends State<SaidInternalScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaidAppbar(
        withArrowBack: true
      ),
      body: widget.body
    );
  }
}