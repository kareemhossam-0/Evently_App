import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/resourses/routes_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/Love/favourite_screen .dart';
import 'package:evently_app/presentation/main_layout/tabs/home/Home_screen.dart';
import 'package:evently_app/presentation/main_layout/tabs/map/map_screen.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../l10n/app_localizations.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  List<Widget> tabs = const [
    Home(),
    MapScreen(),
    Favourite(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFab(),
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      onPressed: _goToCreateEventScreen,
      child: const Icon(Icons.add),
    );
  }

  void _goToCreateEventScreen() {
    Navigator.pushNamed(context, RoutesManager.createEvent);
  }

  Widget buildBottomNavBar() {
    return BottomAppBar(
      notchMargin: 8,
      child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedHome),
                icon: SvgPicture.asset(SvgAssets.unSelectedHome),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedMap),
                icon: SvgPicture.asset(SvgAssets.unSelectedMap),
                label: AppLocalizations.of(context)!.map),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedFav),
                icon: SvgPicture.asset(SvgAssets.unSelectedFav),
                label: AppLocalizations.of(context)!.favourite),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedProfile),
                icon: SvgPicture.asset(SvgAssets.unSelectedProfile),
                label: AppLocalizations.of(context)!.profile),
          ]),
    );
  }

  void _onTap(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}