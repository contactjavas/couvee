// Core packages.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Couvee config.
import 'package:couvee/company_colors.dart';

// Couvee elements.
import 'package:couvee/elements/textured_wall.dart';

// Couvee screens.
import 'package:couvee/screens/home_screen.dart';
import 'package:couvee/screens/menu_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  final _tabPages = <Widget>[
    MenuScreen(),
    Text('Voucher'),
    Text('Merchandise'),
    HomeScreen(),
  ];

  final _navbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/home-icon.png"),
      ),
      title: Container(
        margin: EdgeInsets.only(top: 8.7),
        child: Text('Home'),
      ),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/tshirt-icon.png"),
      ),
      title: Container(
        margin: EdgeInsets.only(top: 8.7),
        child: Text('Merchandise'),
      ),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/voucher-icon.png"),
      ),
      title: Container(
        margin: EdgeInsets.only(top: 8.7),
        child: Text('Voucher'),
      ),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/menu-icon.png"),
      ),
      title: Container(
        margin: EdgeInsets.only(top: 8.7),
        child: Text('Menu'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TexturedWall(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: _tabPages[_selectedTabIndex],
          ),
          bottomNavigationBar: Container(
            height: 90.0,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(
                    0.0,
                    -15.0,
                  ),
                  blurRadius: 20.0,
                )
              ],
            ),
            child: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              items: _navbarItems,
              currentIndex: _selectedTabIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: CompanyColors.inactiveTabColor,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: _onNavbarTapped,
            ),
          ),
        ),
      ],
    );
  }
}
