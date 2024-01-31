import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparkle/screen/home_screen.dart';
import 'package:sparkle/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/images/sparkle_appbar_logo.svg",
          width: 120,
          height: 30,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(PrimaryColor[80]!),
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 20,
              height: 20,
            ),
            label: '홈',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/navigation.svg",
              width: 20,
              height: 20,
            ),
            label: '지도',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: SvgPicture.asset(
                "assets/icons/smiling_face.svg",
                width: 20,
                height: 20,
              ),
            ),
            label: '내 정보',
          ),
        ],
      ),
      body: <Widget>[
        HomeScreen(),
        Text('map page'),
        Text('my page')
      ][currentPageIndex],
    );
  }
}
