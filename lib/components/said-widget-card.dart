import 'package:flutter/material.dart';

class SaidWidgetCard extends StatefulWidget {
  const SaidWidgetCard({ Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _SaidWidgetCardState createState() => _SaidWidgetCardState();
}

class _SaidWidgetCardState extends State<SaidWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: widget.child
        ),
      ),
    );
  }
}