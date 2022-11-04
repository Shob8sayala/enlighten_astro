import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:phanerozoic_assignment/providers/moneyProvider.dart';
import 'package:phanerozoic_assignment/providers/userProvider.dart';
import 'package:phanerozoic_assignment/screens/homePage.dart';
import 'package:phanerozoic_assignment/utils/preferences.dart';
import 'package:provider/provider.dart';

final TextEditingController _mobileController = TextEditingController();
final TextEditingController _otpController = TextEditingController();

extension PhoneValidator on String {
  bool isPhone() {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(this);
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                ),
                Center(
                  child: Image.asset(
                    'assets/splash.png',
                    width: width * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Login/ Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Mobile No.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  //       autovalidateMode: AutovalidateMode.always,
                  // validator: (input) => input.isValidEmail() ? null : "Check your email",
                  controller: _mobileController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((input) =>
                      input!.isPhone() ? null : "Check your number"),
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.white), //<-- SEE HERE
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey), //<-- SEE HERE
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black12), //<-- SEE HERE
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.red), //<-- SEE HERE
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.white), //<-- SEE HERE
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Mobile No."),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'OTP',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _otpController,
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 12),
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.white), //<-- SEE HERE
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey), //<-- SEE HERE
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black12), //<-- SEE HERE
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.red), //<-- SEE HERE
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.white), //<-- SEE HERE
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "OTP"),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_mobileController.text.isPhone()) {
                      Provider.of<UserProvider>(context, listen: false)
                          .setPhone(_mobileController.text);
                      Preferences.setString(
                          "phoneNumber", _mobileController.text);
                      Provider.of<MoneyProvider>(context, listen: false)
                          .setMoney(0);
                      Provider.of<UserProvider>(context, listen: false)
                          .setHistory([]);
                      context.go('/home');
                    }
                  },
                  child: Container(
                    width: width * 0.6,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_circle_right),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("LOGIN"),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Re-Send OTP",
                          style: TextStyle(color: Colors.black),
                        )))
              ]),
        ),
      ),
    );
  }
}
