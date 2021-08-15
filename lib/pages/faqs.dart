import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-title.dart';

class Faqs extends StatefulWidget {
  const Faqs({ Key? key }) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    
    var fitQuestions = [
      AppLocalizations.of(context)!.faqQ1,
      AppLocalizations.of(context)!.faqQ2,
      AppLocalizations.of(context)!.faqQ3,
      AppLocalizations.of(context)!.faqQ4,
      AppLocalizations.of(context)!.faqQ5
    ];

    var fitAnswers = [
      AppLocalizations.of(context)!.faqA1,
      AppLocalizations.of(context)!.faqA2,
      AppLocalizations.of(context)!.faqA3,
      AppLocalizations.of(context)!.faqA4,
      AppLocalizations.of(context)!.faqA5
    ];

    var colonoscopyQuestions = [
      AppLocalizations.of(context)!.faqQ6,
      AppLocalizations.of(context)!.faqQ7,
      AppLocalizations.of(context)!.faqQ8,
      AppLocalizations.of(context)!.faqQ9,
      AppLocalizations.of(context)!.faqQ10,
      AppLocalizations.of(context)!.faqQ11,
      AppLocalizations.of(context)!.faqQ12,
      AppLocalizations.of(context)!.faqQ13,
      AppLocalizations.of(context)!.faqQ14,
      AppLocalizations.of(context)!.faqQ15,
      AppLocalizations.of(context)!.faqQ16
    ];

    var colonoscopyAnswers = [
      AppLocalizations.of(context)!.faqA6,
      AppLocalizations.of(context)!.faqA7,
      AppLocalizations.of(context)!.faqA8,
      AppLocalizations.of(context)!.faqA9,
      AppLocalizations.of(context)!.faqA10,
      AppLocalizations.of(context)!.faqA11,
      AppLocalizations.of(context)!.faqA12,
      AppLocalizations.of(context)!.faqA13,
      AppLocalizations.of(context)!.faqA14,
      AppLocalizations.of(context)!.faqA15,
      AppLocalizations.of(context)!.faqA16
    ];


    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidTitle(
            text: AppLocalizations.of(context)!.faqTitle1,
            padding: EdgeInsets.only(bottom: 15),
          ),
          for (int i = 0; i < fitQuestions.length; i++)
            SaidTextCard(
              title: fitQuestions[i],
              text: fitAnswers[i],
            ),

          SaidTitle(
            text: AppLocalizations.of(context)!.faqTitle2,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          for (int i = 0; i < colonoscopyQuestions.length; i++)
            SaidTextCard(
              title: colonoscopyQuestions[i],
              text: colonoscopyAnswers[i],
            )
        ],
      ),
    );
  }
}