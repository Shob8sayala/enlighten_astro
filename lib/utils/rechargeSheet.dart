import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future rechargeScreen(context) {
  double width = MediaQuery.of(context).size.width;
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    elevation: 8,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        padding: const EdgeInsets.all(20),
        height: 400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Recharge',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 2,
                width: width * 0.72,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 24,
              ),
              Image.asset(
                'assets/rechargewallet.png',
                width: width * 0.36,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Please recharge your wallet before calling",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: const Text('Recharge'),
                onPressed: () => context.push('/wallet'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
