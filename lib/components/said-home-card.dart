import 'package:flutter/material.dart';
import 'package:said/components/said-scaffold.dart';

class SaidCard extends StatefulWidget {
  const SaidCard ({ 
    Key? key,
    required String this.title,
    required Widget this.linkTo,
    String this.icon = "",
    Color this.textColor = Colors.blue,
    Color this.backgroundColor = Colors.white,
    double this.padLeft = 0,
    double this.padRight = 0,
    bool this.hasTabs = false,
    List<Widget> this.tabsIcons = emptyList,
    List<Widget> this.tabsBodies = emptyList
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Widget linkTo;
  final double padRight;
  final double padLeft;
  final String icon;

  final bool hasTabs;
  final List<Widget> tabsIcons;
  final List<Widget> tabsBodies;

  static const List<Widget> emptyList = [];

  @override
  _SaidCardState createState() => _SaidCardState();
}

class _SaidCardState extends State<SaidCard> {
  @override
  Widget build(BuildContext context) {
    bool hasIcon = widget.icon != '';
    return Padding(
      padding: EdgeInsets.only(right: widget.padRight, left: widget.padLeft),
      child: Card(
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
              body: widget.linkTo,
              hasParent: true,  
              hasTabs: widget.hasTabs,
              tabsIcons: widget.tabsIcons,
              tabsBodies: widget.tabsBodies,
            )));
          },
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: widget.textColor
                  ),
                  textAlign: TextAlign.center,
                ),
                if (hasIcon)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ImageIcon(
                      AssetImage('assets/icons/' + widget.icon),
                      color: widget.textColor,
                      size: 40,
                    ),
                  )
              ],
            ),
          ),
        )
      )
    );
  }
}