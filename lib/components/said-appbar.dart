import 'package:flutter/material.dart';

void changeLanguage() {
  print("translating");
  // Localizations.
}

const List<Widget> emptyList = [];

saidAppbar({ 
  required BuildContext context, 
  bool withArrowBack = false,
  bool hasTabs = false,
  List<Widget> tabsIcons = emptyList
}) => AppBar(
  automaticallyImplyLeading: true,
  title: Image(
    image: AssetImage(
      'assets/img/logo-white.png',
    ),
    height: 40,
  ),
  bottom: (hasTabs)? TabBar(
    tabs: [
      for (Widget icon in tabsIcons)
        Tab(icon: icon)
    ],
    indicatorSize: TabBarIndicatorSize.label,
  ): null,
  leading: (withArrowBack)? IconButton(
    onPressed: () {
      Navigator.pop(context);
    }, 
    icon: Icon(Icons.arrow_back)) : null,
  centerTitle: true,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)
  )
);