import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class myBottomNavBar extends StatefulWidget {
  const myBottomNavBar({super.key});

  @override
  State<myBottomNavBar> createState() => _myBottomNavBarState();
}

class _myBottomNavBarState extends State<myBottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle:
            const TextStyle(color: Colors.black, fontSize: 14),
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              context.go('/home');
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              context.go('/profile');
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.phone_callback,
              ),
              label: "Call Us"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.whatsapp_rounded,
              ),
              label: "WhatsApp"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "MyProfile"),
        ]);
  }
}
