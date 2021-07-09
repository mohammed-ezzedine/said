import 'package:flutter/material.dart';

void changeLanguage() {
  print("translating");
  // Localizations.
}

saidAppbar({ required BuildContext context, bool withArrowBack = false}) => AppBar(
  automaticallyImplyLeading: true,
  title: Image(
    image: AssetImage(
      'assets/img/logo-white.png',
    ),
    height: 40,
  ),
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