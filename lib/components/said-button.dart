import 'package:flutter/material.dart';
import 'package:said/components/said-scaffold.dart';

class SaidButton extends StatefulWidget {
  const SaidButton({ Key? key, required this.child, required this.text, this.padding = EdgeInsets.zero }) : super(key: key);

  final Widget child;
  final String text;
  final EdgeInsetsGeometry padding;

  @override
  _SaidButtonState createState() => _SaidButtonState();
}

class _SaidButtonState extends State<SaidButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Expanded(
        child: Card(
          elevation: 2,
          color: Color(0xFFF59E0B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
                body: widget.child,
                hasParent: true,  
              )));
            },
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
          ),
        )
      ),
    );
  }
}