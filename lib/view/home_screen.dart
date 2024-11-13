import 'package:flutter/material.dart';
import 'package:untitled1/utils/utils.dart';
import 'package:untitled1/view/checkout_screen.dart';
import 'package:untitled1/view/profile_screen.dart';
import 'package:untitled1/view/setting_Screen.dart';
import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> dropdownList = <String>['All categories', 'other', 'other'];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  List<Widget>get options =>  <Widget>[
    ProductListView(searchName: searchController.text.trim(),),
    CheckoutScreen(),
    SettingScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = dropdownList.first;
    final responsive = Responsive(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: responsive.screenHeight * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.containerColor),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        style: const TextStyle(color: AppColor.homeScreenColor),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.homeScreenColor,
                        ),
                        underline: Container(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: dropdownList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      horizontalSpacing(space: responsive.screenWidth * 0.24),
                      const Text(
                        'POS ',
                        style: TextStyle(color: AppColor.homeScreenColor),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColor.homeScreenColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                size: 20,
                                color: AppColor.containerColor,
                              ),
                              Text(
                                'Logout',
                                style:
                                    TextStyle(color: AppColor.containerColor),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: responsive.screenHeight * 0.13,
                  left: 20,
                  width: responsive.screenWidth * 0.9,
                  child:  SearchBar(
                    controller: searchController,
                      padding:
                         const  WidgetStatePropertyAll(EdgeInsets.only(left: 18)),
                      leading: const Icon(
                        Icons.search_rounded,
                        color: AppColor.textColor,
                      ),
                      hintText: 'Search Product',
                      hintStyle: const WidgetStatePropertyAll(
                          TextStyle(color: AppColor.textColor))),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin:
                          EdgeInsets.only(top: responsive.screenHeight * 0.25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColor.textColor,
                                blurRadius: 1,
                                spreadRadius: 1)
                          ]),
                      height: responsive.screenHeight * 0.68,
                      width: responsive.screenWidth * 0.95,
                      child: options.elementAt(currentIndex)),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeScreenNavBar(
        selectedIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
