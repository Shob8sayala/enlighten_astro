import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:phanerozoic_assignment/providers/moneyProvider.dart';
import 'package:phanerozoic_assignment/providers/userProvider.dart';
import 'package:phanerozoic_assignment/utils/appBar.dart';
import 'package:phanerozoic_assignment/utils/bottomNavBar.dart';
import 'package:phanerozoic_assignment/utils/preferences.dart';
import 'package:phanerozoic_assignment/utils/sideDrawer.dart';
import 'package:phanerozoic_assignment/widgets/customContainer.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: myAppBar(),
      ),
      bottomNavigationBar: myBottomNavBar(),
      drawer: SideDrawer(),
      body: Container(
        padding: EdgeInsets.all(12),
        width: width,
        child: CustomContainerWdt(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 4)),
                  child: Icon(
                    Icons.person,
                    size: 120,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  Provider.of<UserProvider>(context).phone,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
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
                      children: const [
                        Icon(Icons.arrow_circle_right),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Sign Out"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
