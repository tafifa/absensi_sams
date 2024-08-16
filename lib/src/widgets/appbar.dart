import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightGreen[600],
      elevation: 10,
      // leading: const Padding(
      //   padding: EdgeInsets.only(left:16.0),
      //   child: CircleAvatar(
      //       backgroundColor: Colors.grey,
      //     ),
      // ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, John Doe!',
            style: TextStyle(color: Colors.white), // Add this line if you want to change the text color to black
          ),
          /*Text(
            'Copywriter',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),*/
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.notifications_none, color: Colors.white), // Add this line to set the icon color
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
