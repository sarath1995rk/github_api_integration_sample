import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String image;
  final String userName;
  final int repo;

  ProfileScreen(this.image, this.userName, this.repo);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(image),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(userName),
        const SizedBox(
          height: 10,
        ),
        Text('$repo repositories')
      ],
    );
  }
}
