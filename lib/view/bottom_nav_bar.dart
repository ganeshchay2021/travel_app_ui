import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app_ui/view/home/home_screen.dart';
import 'package:travel_app_ui/view/home/pages/bookmark_screen.dart';
import 'package:travel_app_ui/view/home/pages/conformation_number_screen.dart';
import 'package:travel_app_ui/view/home/pages/profile_screen.dart';
import 'package:travel_app_ui/view/home/pages/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<IconData> icon = [
    Iconsax.home1,
    Iconsax.search_normal,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline,
    Icons.person_outline,
  ];

  final List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    ConformationNumberScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icon.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Icon(
                icon[index],
                color: currentIndex == index ? Colors.white : Colors.grey.shade800,
              ),
            );
          }),
        ),
      ),
    );
  }
}
