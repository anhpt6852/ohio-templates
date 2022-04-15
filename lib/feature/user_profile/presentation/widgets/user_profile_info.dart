// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            children: [
            CircleAvatar(
              backgroundImage: AssetImage(""),
            ),
            Positioned(
              child: SizedBox(child: ))
            ]
          ),
        )
      ],
    );
  }
}
