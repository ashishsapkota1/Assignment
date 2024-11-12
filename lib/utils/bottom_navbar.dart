import 'package:flutter/material.dart';
import 'package:untitled1/utils/utils.dart';

class HomeScreenNavBar extends StatefulWidget {
  const HomeScreenNavBar({super.key});

  @override
  State<HomeScreenNavBar> createState() => _HomeScreenNavBarState();
}

class _HomeScreenNavBarState extends State<HomeScreenNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined, ), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.settings, ), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined, ), label: ''),

    ],
    unselectedItemColor: AppColor.textColor,

    currentIndex: _selectedIndex,
    selectedItemColor: AppColor.containerColor,

    onTap: (int index){
      setState(() {
        _selectedIndex = index;
      });
    },);
  }
}
