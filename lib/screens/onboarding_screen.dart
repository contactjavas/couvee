// Core packages.
import 'dart:io';
import 'package:flutter/material.dart';

// Extension packages.
import 'package:hive/hive.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';
import 'package:couvee/screens/pre_login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);

  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0.0,
              top: MediaQuery.of(context).size.height / 8.5,
              child: Image.asset(
                'assets/images/onboarding/top-left-ornament.png',
              ),
            ),
            Positioned(
              right: 0.0,
              top: MediaQuery.of(context).size.height / 6.5,
              child: Image.asset(
                'assets/images/onboarding/top-right-ornament.png',
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: MediaQuery.of(context).size.height / 8.5,
              child: Image.asset(
                'assets/images/onboarding/bottom-left-ornament.png',
              ),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                  image: 'assets/images/onboarding/illustration-image-1.png',
                  title: 'Kumpulkan Couvee Poin',
                  body:
                      'Dapatkan produk Couvee favoritmu di outlet terdekat dan kumpulkan poinnya!',
                ),
                _buildPageContent(
                  image: 'assets/images/onboarding/illustration-image-2.png',
                  title: 'Tukar Poin dengan Merchandise',
                  body:
                      'Tukarkan poin yang terkumpul dengan merchandise unik dari Couvee',
                ),
                _buildPageContent(
                  image: 'assets/images/onboarding/illustration-image-3.png',
                  title: 'Tukar Poin dengan Voucher',
                  body:
                      'Tukarkan poin yang terkumpul dengan merchandise voucher belanja di Couvee',
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: _currentPage != 2
          ? Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                      setState(() {});
                    },
                    child: Text(
                      'Skip',
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 140,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      elevation: 0,
                      onPressed: () {
                        _pageController.animateToPage(_currentPage + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                final settingBox = Hive.box('setting');

                settingBox.put('hideOnboarding', 1);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreLoginScreen()),
                );
              },
              child: Container(
                height: Platform.isIOS ? 70 : 60,
                color: CompanyColors.brown,
                alignment: Alignment.center,
                child: Text(
                  'Mulai Sekarang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? CompanyColors.brown : Colors.brown[100],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _buildPageContent({
    String image,
    String title,
    String body,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(image),
          ),
          SizedBox(height: 34),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 14),
          Text(
            body,
            style: TextStyle(
              fontSize: 14,
              height: 1.8,
              color: CompanyColors.grey,
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < _totalPages; i++)
                  i == _currentPage
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
