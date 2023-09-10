import 'package:flutter/material.dart';

class CardInfoRow extends StatelessWidget {
  const CardInfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 8.0),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.lightBlueAccent),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
