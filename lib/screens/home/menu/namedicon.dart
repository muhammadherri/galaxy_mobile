import 'package:flutter/material.dart';

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  // final ImageIcon imageData;
  final String text;
  final VoidCallback? onTap;
  final int notificationCount;

  const NamedIcon({
    Key? key,
    this.onTap,
    required this.text,
    required this.iconData,
    // required this.imageData,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(
                //   'assets/icons/notificationtactive.png',
                //   height: 20,
                //   // color: Colors.white,
                // ),

                Icon(
                  iconData,
                  color: Colors.white,
                ),
                Text(text, overflow: TextOverflow.ellipsis),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
                child: Text('$notificationCount'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
