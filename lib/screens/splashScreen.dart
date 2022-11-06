import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/models/userModel.dart';
import 'package:enlighten_astro/providers/moneyProvider.dart';
import 'package:enlighten_astro/providers/userProvider.dart';
import 'package:enlighten_astro/screens/homePage.dart';
import 'package:enlighten_astro/screens/loginScreen.dart';
import 'package:enlighten_astro/utils/preferences.dart';
import 'package:provider/provider.dart';

bool isInitialized = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String phNo = "";
  bool loggedIn = false;
  int money = 0;

  @override
  void initState() {
    debugPrint("lol");
    print("object");
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("XDXD");
      if (Preferences.getString("phoneNumber") != null &&
          Preferences.getString("phoneNumber") != "") {
        print("if cond");
        phNo = Preferences.getString("phoneNumber")!;
        money = Preferences.getInt("money");
        loggedIn = true;
        // List<List<String>> hist = [];
        Provider.of<UserProvider>(context, listen: false).setPhone(phNo);
        Provider.of<MoneyProvider>(context, listen: false).setMoney(money);
        if (Preferences.getString("history") != null &&
            Preferences.getString("history") != "") {
          List<List<String>> list = json
              .decode(Preferences.getString("history")!)
              .map<List<String>>((e) =>
                  e.map<String>((x) => x as String).toList() as List<String>)
              .toList();
          print(list);
          print(list.runtimeType);
          Provider.of<UserProvider>(context, listen: false).setHistory(list);
        }
      }
      // FlutterNativeSplash.remove();
      if (loggedIn == false) {
        context.go("/login");
      } else {
        context.go("/home");
      }
      print("XDXDend");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
