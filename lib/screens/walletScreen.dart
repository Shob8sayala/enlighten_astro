import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/providers/userProvider.dart';
import 'package:enlighten_astro/utils/appBar.dart';
import 'package:enlighten_astro/utils/bottomNavBar.dart';
import 'package:enlighten_astro/utils/sideDrawer.dart';
import 'package:enlighten_astro/widgets/customContainer.dart';
import 'package:provider/provider.dart';
import '../providers/moneyProvider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => WalletScreenState();
}

class WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return Navigator.canPop(context);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: myAppBar(),
        ),
        bottomNavigationBar: myBottomNavBar(),
        drawer: SideDrawer(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomContainerWdt(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Wallet Balance",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.wallet,
                            color: Theme.of(context).primaryColor,
                            size: 32,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "₹ ${Provider.of<MoneyProvider>(context).money}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/payment');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text("ADD MONEY TO WALLET"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomContainerWdt(
                text: "Previous Transactions",
                child: SingleChildScrollView(
                  child: Column(
                      children:
                          Provider.of<UserProvider>(context).history.length > 0
                              ? Provider.of<UserProvider>(context)
                                  .history
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${e[0]}   |   ${e[1]}   |   ${e[2]}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No history available.",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
