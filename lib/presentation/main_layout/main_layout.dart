import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/Love/Love_screen.dart';
import 'package:evently_app/presentation/main_layout/tabs/home/Home_screen.dart';
import 'package:evently_app/presentation/main_layout/tabs/map/map_screen.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  List<Widget> tabs = const [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFab(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: tabs[selectedIndex],
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onTap,
      currentIndex: selectedIndex,

      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.unSelectedHome),
          label: 'Home',
          activeIcon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.selectedHome),
        ),

        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.unSelectedMap),
          label: 'Map',
          activeIcon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.selectedMap),
        ),

        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.unSelectedFav),
          label: 'Love',
          activeIcon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.selectedFav),
        ),

        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.unSelectedProfile),
          label: 'Profile',
          activeIcon: SvgPicture.asset(
              width: 25.w, height: 25.h, SvgAssets.selectedProfile),
        ),
      ],
    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }

  void _onTap(newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
