import 'package:flutter/material.dart';

import './said-appbar.dart';
import './said-drawer.dart';

class SaidScaffold extends StatefulWidget {
  const SaidScaffold(
      {Key? key,
      required Widget this.body,
      bool this.hasParent = false,
      bool this.hasTabs = false,
      List<Widget> this.tabsIcons = emptyList,
      List<Widget> this.tabsBodies = emptyList})
      : super(key: key);

  final Widget body;
  final bool hasParent;
  final bool hasTabs;
  final List<Widget> tabsIcons;
  final List<Widget> tabsBodies;

  static const List<Widget> emptyList = [];

  @override
  _SaidScaffoldState createState() => _SaidScaffoldState();
}

class _SaidScaffoldState extends State<SaidScaffold> {
  Widget getTabbedScaffold(BuildContext context) {
    return Scaffold(
      appBar: SaidAppbar(
          withArrowBack: widget.hasParent,
          hasTabs: true,
          tabsIcons: widget.tabsIcons),
      body: TabBarView(
        children: widget.tabsBodies,
      ),
      endDrawer: SaidDrawer(),
    );
  }

  Widget getUntabbedScaffold(BuildContext context) {
    return Scaffold(
      appBar: SaidAppbar(withArrowBack: widget.hasParent),
      body: widget.body,
      endDrawer: SaidDrawer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.hasTabs)
        ? DefaultTabController(
            length: widget.tabsIcons.length, child: getTabbedScaffold(context))
        : getUntabbedScaffold(context);
  }
}
