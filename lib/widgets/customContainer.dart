import 'package:flutter/material.dart';

class CustomContainerWdt extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final String? text;

  const CustomContainerWdt({super.key, this.color, this.child, this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.88,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (text != null)
              ? Text(
                  "$text",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              : Container(),
          const SizedBox(
            height: 12,
          ),
          (child != null) ? child! : Container(),
        ],
      ),
    );
  }
}
