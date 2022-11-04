import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class DrawerItem extends StatelessWidget {
  IconData icon;
  String title;
  String? route;
  DrawerItem({super.key, required this.icon, required this.title, this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (route != null) context.go(route!);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}
