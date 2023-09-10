import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your name',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Mobile developer',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
