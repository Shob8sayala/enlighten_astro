import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:phanerozoic_assignment/providers/moneyProvider.dart';
import 'package:phanerozoic_assignment/providers/userProvider.dart';
import 'package:phanerozoic_assignment/utils/appBar.dart';
import 'package:phanerozoic_assignment/utils/bottomNavBar.dart';
import 'package:phanerozoic_assignment/utils/rechargeSheet.dart';
import 'package:phanerozoic_assignment/utils/sideDrawer.dart';
import 'package:phanerozoic_assignment/widgets/customContainer.dart';
import 'package:provider/provider.dart';

class ConsOptionsScreen extends StatefulWidget {
  const ConsOptionsScreen({super.key});

  @override
  State<ConsOptionsScreen> createState() => _ConsOptionsScreenState();
}

class _ConsOptionsScreenState extends State<ConsOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    int money = Provider.of<MoneyProvider>(context).money;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return Navigator.canPop(context);
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: myAppBar(),
        ),
        drawer: SideDrawer(),
        bottomNavigationBar: myBottomNavBar(),
        body: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 8.0, horizontal: width * 0.052),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomContainerWdt(
                  text:
                      "GET FIRST 15 MIN. PERSONALIZED ONE TO ONE PHONE CONSULTATION",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '@499',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: "FREE",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/userDetails');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.call),
                              SizedBox(width: 12),
                              Text(
                                "CONSULT NOW",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomContainerWdt(
                  text: "PERSONALIZED ONE TO ONE CONSULTATION ON THE PHONE ",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'This item costs ',
                          children: <TextSpan>[
                            TextSpan(
                              text: "@449",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (money < 499) {
                              rechargeScreen(context);
                            } else {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setFees(499);
                              context.push('/userDetails');
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.call),
                              SizedBox(width: 12),
                              Text(
                                "CONSULT NOW",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomContainerWdt(
                  text: "PERSONALIZED CONSULTATION ON MESSAGE",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'This item costs ',
                          children: <TextSpan>[
                            TextSpan(
                              text: "@100",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Provider.of<MoneyProvider>(context, listen: false)
                            //     .addMoney();
                            if (money < 100) {
                              rechargeScreen(context);
                            } else {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setFees(100);
                              context.push('/userDetails');
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.call),
                              SizedBox(width: 12),
                              Text(
                                "CONSULT NOW",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
