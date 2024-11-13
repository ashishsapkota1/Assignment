import 'package:flutter/material.dart';
import 'package:untitled1/utils/utils.dart';

class HomeScreenNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const HomeScreenNavBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  State<HomeScreenNavBar> createState() => _HomeScreenNavBarState();
}

class _HomeScreenNavBarState extends State<HomeScreenNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined, ), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.settings, ), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined, ), label: ''),

    ],

    unselectedItemColor: AppColor.textColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 20,

    currentIndex: widget.selectedIndex,
    selectedItemColor: AppColor.containerColor,

    onTap: widget.onTap);
  }
}
