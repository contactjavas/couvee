// Core packages.
import 'package:couvee/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Couvee config.
import 'package:couvee/company_colors.dart';

// Couvee elements.
import 'package:couvee/elements/textured_wall.dart';

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

  final List<Widget> _tabPages = [
    HomeScreen(),
    Merchandise(),
    VouchersScreen(),
    MenuScreen(),
  ];

  final _navbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/home-icon.png"),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/tshirt-icon.png"),
      ),
      label: 'Merchandise',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/voucher-icon.png"),
      ),
      label: 'Voucher',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/tab-icons/menu-icon.png"),
      ),
      label: 'Menu',
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
