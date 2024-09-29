import 'package:flutter/material.dart';
import 'package:sitegalleria/const.dart';
import 'package:sitegalleria/models/type.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  // Capitalize the first letter of each word
  String _capitalizeFirstLetter(String text) {
    return text.split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  List<Tab> _buildCategoryTabs() {
    return Category.values.map((category) {
      String categoryName = category.toString().split('.').last;
      String capitalizedCategory = _capitalizeFirstLetter(categoryName);

      return Tab(
        text: capitalizedCategory,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Color2, // Indicator color
          width: 1.0, // Thickness of the indicator
        ),
      ),
      labelColor: Colors.white, // Active tab text color
      unselectedLabelColor: Color5, // Inactive tab text color

      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      indicatorColor: Color2,
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
