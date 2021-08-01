import 'package:flutter/material.dart';

class SaidText extends StatefulWidget {
  const SaidText({ Key? key, required this.text, this.padding = EdgeInsets.zero, this.color = Colors.black }) : super(key: key);

  final String text;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  _SaidTextState createState() => _SaidTextState();
}

class _SaidTextState extends State<SaidText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Text(
        widget.text,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 17,
          color: widget.color
        ),
      ),
    );
  }
}