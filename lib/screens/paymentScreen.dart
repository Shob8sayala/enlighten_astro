import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/providers/moneyProvider.dart';
import 'package:enlighten_astro/providers/userProvider.dart';
import 'package:enlighten_astro/utils/appBar.dart';
import 'package:enlighten_astro/utils/bottomNavBar.dart';
import 'package:enlighten_astro/utils/preferences.dart';
import 'package:enlighten_astro/utils/sideDrawer.dart';
import 'package:enlighten_astro/widgets/customContainer.dart';
import 'package:provider/provider.dart';

bool _isNumeric(String? str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _moneyToAdd = 0;
  TextEditingController _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget customContainer(
      Widget leading,
      String text,
      String? route,
    ) {
      return GestureDetector(
        onTap: () {
          if (route != null) {
            Provider.of<UserProvider>(context, listen: false).addHistory(
                ["Tl-43853538", DateTime.now().toString(), "₹${_moneyToAdd}"]);
            final String encodedHist = jsonEncode(
                Provider.of<UserProvider>(context, listen: false).history);
            print(encodedHist);
            Provider.of<MoneyProvider>(context, listen: false)
                .addMoney(_moneyToAdd);
            Preferences.setString("history", encodedHist);
            Preferences.setInt(
              "money",
              Provider.of<MoneyProvider>(context, listen: false).money,
            );
            context.go(route);
          }
        },
        child: Container(
          width: width * 0.76,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.black26, width: 1),
                right: BorderSide(color: Colors.black26, width: 1),
                bottom: BorderSide(color: Colors.black26, width: 1)),
          ),
          child: Row(
            children: [
              leading,
              SizedBox(
                width: 2,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.go('/wallet');
        return Navigator.canPop(context);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: myAppBar(),
        ),
        bottomNavigationBar: myBottomNavBar(),
        drawer: SideDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //upper gradient container
                  Container(
                    width: width * 0.8,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: const [
                            Color(0xfffb9470),
                            Color(0xffd36b48),
                          ]),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/insaaf.png',
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Insaaf",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              Text(
                                "Consultancy Payment",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: const Text('Enter Amount:'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              TextFormField(
                                                controller: _moneyController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: ((input) =>
                                                    _isNumeric(input)
                                                        ? null
                                                        : "Enter valid number"),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _moneyToAdd = int.parse(
                                                      _moneyController.text);
                                                  if (_moneyToAdd > 50000)
                                                    _moneyToAdd = 50000;
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: const Text('Add'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Text(
                                  "₹ ${_moneyToAdd}",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: const [
                            Color(0xffcf7251),
                            Color(0xffbb5e3f),
                          ]),
                    ),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Row(
                          children: const [
                            Text(
                              "English",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        )),
                  ),

                  //phone and email
                  SizedBox(height: 12),
                  customContainer(
                      Icon(
                        Icons.edit_note_rounded,
                        color: Colors.orange,
                        size: 40,
                      ),
                      "${Provider.of<UserProvider>(context).phone} | info@dixinfotech.com",
                      null),
                  SizedBox(height: 24),

                  //payment methods
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Prefered Payment Methods",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 12),
                  customContainer(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/gpay.png',
                          width: 32,
                        ),
                      ),
                      "UPI - Google Pay",
                      '/paymentConformation'),
                  // SizedBox(height: 12),
                  customContainer(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/paytm.jpg',
                          width: 32,
                        ),
                      ),
                      "UPI - PayTM",
                      '/paymentConformation'),
                  // SizedBox(height: 12),
                  customContainer(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/ppay.png',
                          width: 32,
                        ),
                      ),
                      "UPI - PhonePe",
                      '/paymentConformation'),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "CARDS, UPI & MORE",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 12),
                  customContainer(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.creditCard,
                          size: 24,
                          color: Colors.orange,
                        ),
                      ),
                      "Cards - Visa,MasterCard, RuPay & More",
                      '/paymentConformation'),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
