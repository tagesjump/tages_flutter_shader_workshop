import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shader_workshop/assets.dart';
import 'package:flutter_shader_workshop/widgets/card_avatar.dart';
import 'package:flutter_shader_workshop/widgets/card_footer.dart';
import 'package:flutter_shader_workshop/widgets/card_header.dart';
import 'package:flutter_shader_workshop/widgets/card_info_row.dart';
import 'package:provider/provider.dart';

class BusinessCard extends StatefulWidget {
  const BusinessCard({
    super.key,
  });

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Text(
                  'Hello world!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // TODO: shader
          ],
        ),
      ),
    );
  }

  // void _onPanUpdate(DragUpdateDetails e) {
  //   setState(() {
  //     _mousePosition = e.localPosition.dx / MediaQuery.sizeOf(context).width;
  //   });
  // }
  //
  // void _onMouseHover(PointerHoverEvent e) {
  //   setState(() {
  //     _mousePosition = e.localPosition.dx / MediaQuery.sizeOf(context).width;
  //   });
  // }

  // transform: Matrix4.identity()..setEntry(3, 0, (_mousePosition - 0.5) * 0.001),
}
