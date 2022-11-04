import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:phanerozoic_assignment/providers/moneyProvider.dart';
import 'package:provider/provider.dart';

class myAppBar extends StatefulWidget {
  const myAppBar({super.key});

  @override
  State<myAppBar> createState() => _myAppBarState();
}

class _myAppBarState extends State<myAppBar> {
  @override
  Widget build(BuildContext context) {
    // print("MONEY = $money");
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      )),
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          const Text(
            'ENLIGHTEN MIND',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(Icons.account_balance_wallet),
              iconSize: 24,
              onPressed: () {
                context.go('/wallet');
              }),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${Provider.of<MoneyProvider>(context).money}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
