import 'package:copy_facebook_ui/config/palette.dart';
import 'package:copy_facebook_ui/pages/screens/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    MdiIcons.accountGroupOutline,
    MdiIcons.menu,
  ];

  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CoustTabBar(
            icons: _icons,
            selectedIndex: _selectIndex,
            onpress: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

class CoustTabBar extends StatelessWidget {
  const CoustTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onpress})
      : super(key: key);

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onpress;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onpress,
    );
  }
}
