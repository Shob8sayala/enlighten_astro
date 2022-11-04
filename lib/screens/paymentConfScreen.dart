import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:phanerozoic_assignment/utils/appBar.dart';
import 'package:phanerozoic_assignment/utils/bottomNavBar.dart';
import 'package:phanerozoic_assignment/utils/sideDrawer.dart';
import 'package:phanerozoic_assignment/widgets/customContainer.dart';

class PaymentConfScreen extends StatelessWidget {
  const PaymentConfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        context.go('/wallet');
        return Navigator.canPop(context);
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: myAppBar(),
        ),
        bottomNavigationBar: myBottomNavBar(),
        drawer: const SideDrawer(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: CustomContainerWdt(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.8,
                    height: 140,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green[900],
                    size: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 72.0, vertical: 20),
                    child: Text(
                      "THANK YOU FOR YOUR PAYMENT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/consOptions');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.call_rounded),
                          SizedBox(
                            width: 12,
                            height: 64,
                          ),
                          Text("CALL OUR EXPERTS"),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
