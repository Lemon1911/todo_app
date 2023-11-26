import 'package:flutter/material.dart';
import 'package:todo_app/layout/bottom_sheet_widget.dart';

import '../moduls/home_screen/home_screen.dart';
import '../moduls/settings_screen/settings_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static String routeName = "HomeLayout_Screen";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      extendBody: true,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(6),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: FloatingActionButton(
            onPressed: () {
              showAddTaskBottomSheet();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(
              () {
                selectedIndex = index;
              },
            );
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: ImageIcon(
                AssetImage(
                  "assets/images/Icon awesome-list.png",
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: ImageIcon(
                AssetImage(
                  "assets/images/Icon feather-settings.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      )),
      builder: (context) => BottomSheetWidget(),
    );
  }
}
