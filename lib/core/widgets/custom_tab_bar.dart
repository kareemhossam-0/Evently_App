import 'package:evently_app/core/data/DM/category_dm.dart';
import 'package:evently_app/core/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedTabBg,
    required this.unselectedTabBg,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
  });

  final List<CategoryDM> categories;
  final Color selectedTabBg;
  final Color unselectedTabBg;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: _onTabItemClicked,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs:
            widget.categories
                .map(
                  (category) => CustomTab(
                    selectedTabBg: widget.selectedTabBg,
                    unselectedTabBg: widget.unselectedTabBg,
                    selectedLabelColor: widget.selectedLabelColor,
                    unselectedLabelColor: widget.unselectedLabelColor,
                    categoryDM: category,
                    isSelected:
                        widget.categories.indexOf(category) == selectedIndex,
                  ),
                )
                .toList(),
      ),
    );
  }

  void _onTabItemClicked(int newTabIndex) {
    setState(() {
      selectedIndex = newTabIndex;
    });
  }
}
