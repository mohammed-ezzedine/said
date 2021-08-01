import 'package:flutter/material.dart';

class SaidTitle extends StatefulWidget {
  const SaidTitle({ Key? key, required this.text, this.padding = EdgeInsets.zero }) : super(key: key);

  final String text;
  final EdgeInsetsGeometry padding;

  @override
  _SaidTitleState createState() => _SaidTitleState();
}

class _SaidTitleState extends State<SaidTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Text(widget.text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFFF59E0B),
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
}