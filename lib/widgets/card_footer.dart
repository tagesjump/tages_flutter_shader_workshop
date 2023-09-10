import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  const CardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tages',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
      textAlign: TextAlign.center,
    );
  }
}
