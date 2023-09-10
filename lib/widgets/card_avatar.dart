import 'package:flutter/material.dart';

class CardAvatar extends StatelessWidget {
  const CardAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CircleAvatar(
        foregroundImage: const AssetImage('assets/images/avatar.png'),
        maxRadius: MediaQuery.of(context).size.width / 2 - 96.0,
      ),
    );
  }
}
