import 'package:flutter/material.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';

class SaidTextCard extends StatefulWidget {
  const SaidTextCard({ Key? key, required this.text, this.title = '' }) : super(key: key);

  final String text;
  final String title;

  @override
  _SaidTextCardState createState() => _SaidTextCardState();
}

class _SaidTextCardState extends State<SaidTextCard> {
  @override
  Widget build(BuildContext context) {
    return SaidWidgetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != '')
            SaidTitle(
              padding: EdgeInsets.only(bottom: 20),
              text: widget.title,
            ),
          SaidText(text: widget.text)
        ],
      )
    );
  }
}