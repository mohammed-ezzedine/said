import 'package:flutter/material.dart';

const List<Widget> emptyList = [];

class SaidAppbar extends StatefulWidget implements PreferredSizeWidget {
  const SaidAppbar({ 
    Key? key,
    this.withArrowBack = false,
    this.hasTabs = false,
    this.tabsIcons = emptyList
  }) : super(key: key);

  final bool withArrowBack;
  final bool hasTabs;
  final List<Widget> tabsIcons;

  @override
  _SaidAppbarState createState() => _SaidAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(hasTabs? 100 : 60);
}

class _SaidAppbarState extends State<SaidAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Image(
        image: AssetImage(
          'assets/img/logo-white.png',
        ),
        height: 40,
      ),
      bottom: (widget.hasTabs)? TabBar(
        tabs: [
          for (Widget icon in widget.tabsIcons)
            Tab(icon: icon)
        ],
        indicatorSize: TabBarIndicatorSize.label,
      ): null,
      leading: (widget.withArrowBack)? IconButton(
        onPressed: () {
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back)) : null,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      )
    );
  }
}

// saidAppbar({ 
//   required BuildContext context, 
//   bool withArrowBack = false,
//   bool hasTabs = false,
//   List<Widget> tabsIcons = emptyList
// }) => AppBar(
//   automaticallyImplyLeading: true,
//   title: Image(
//     image: AssetImage(
//       'assets/img/logo-white.png',
//     ),
//     height: 40,
//   ),
//   bottom: (hasTabs)? TabBar(
//     tabs: [
//       for (Widget icon in tabsIcons)
//         Tab(icon: icon)
//     ],
//     indicatorSize: TabBarIndicatorSize.label,
//   ): null,
//   leading: (withArrowBack)? IconButton(
//     onPressed: () {
//       Navigator.pop(context);
//     }, 
//     icon: Icon(Icons.arrow_back)) : null,
//   centerTitle: true,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(20)
//   )
// );