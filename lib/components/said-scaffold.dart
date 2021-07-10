import 'package:flutter/material.dart';

import './said-appbar.dart';
import './said-drawer.dart';

class SaidScaffold extends StatelessWidget {
  const SaidScaffold({ 
    Key? key, 
    required Widget this.body, 
    bool this.hasParent = false,
    bool this.hasTabs = false,
    List<Widget> this.tabsIcons = emptyList,
    List<Widget> this.tabsBodies = emptyList
  }) : super(key: key);

  final Widget body;
  final bool hasParent;
  final bool hasTabs;
  final List<Widget> tabsIcons;
  final List<Widget> tabsBodies;

  static const List<Widget> emptyList = [];

  Widget getTabbedScaffold(BuildContext context) {
    return Scaffold(
      appBar: saidAppbar(
        context: context,
        withArrowBack: hasParent,
        hasTabs: true,
        tabsIcons: tabsIcons
      ),
      body: TabBarView(
        children: tabsBodies,
      ),
      endDrawer: SaidDrawer(),
    );
  }

  Widget getUntabbedScaffold(BuildContext context) {
    return Scaffold(
      appBar: saidAppbar(
        context: context,
        withArrowBack: hasParent
      ),
      body: body,
      endDrawer: SaidDrawer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (hasTabs)?  DefaultTabController(
      length: tabsIcons.length,
      child: getTabbedScaffold(context)
    ) : getUntabbedScaffold(context);
  }
}