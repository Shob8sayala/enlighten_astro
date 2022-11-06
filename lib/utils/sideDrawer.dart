import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/providers/userProvider.dart';
import 'package:enlighten_astro/utils/preferences.dart';
import 'package:enlighten_astro/utils/sideDrawerItem.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      width: width * 0.68,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            )),
        const Center(
          child: Icon(
            Icons.person_pin,
            size: 64,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            Provider.of<UserProvider>(context).phone,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        DrawerItem(icon: Icons.home_filled, title: "HOME", route: '/home'),
        DrawerItem(
            icon: Icons.contacts,
            title: "BOOK A CONSULTANT",
            route: '/consOptions'),
        DrawerItem(icon: Icons.video_file, title: "VIDEO", route: '/home'),
        DrawerItem(icon: Icons.shop, title: "SHOP ONLINE", route: '/home'),
        DrawerItem(icon: Icons.call, title: "CALL US"),
        DrawerItem(icon: Icons.whatsapp, title: "WHATSAPP"),
        DrawerItem(icon: Icons.share, title: "SHARE"),
        DrawerItem(icon: Icons.rate_review, title: "RATE US"),
        const SizedBox(
          height: 24,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: width * 0.12,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              const Text(
                "Available on",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 12),
              Container(
                height: 2,
                width: width * 0.12,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.facebook,
                color: Colors.white,
                size: 32,
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                FontAwesomeIcons.youtube,
                color: Colors.white,
                size: 32,
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                FontAwesomeIcons.instagram,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Preferences.setString("phoneNumber", "");
              Preferences.setInt("money", 0);
              Preferences.setString("history", "");
              context.go('/login');
            },
            child: Container(
              width: width * 0.4,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_circle_right,
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
