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
  double _mousePosition = 0.5;

  void _onPanUpdate(DragUpdateDetails e) {
    setState(() {
      _mousePosition = e.localPosition.dx / MediaQuery.sizeOf(context).width;
    });
  }

  void _onMouseHover(PointerHoverEvent e) {
    setState(() {
      _mousePosition = e.localPosition.dx / MediaQuery.sizeOf(context).width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onPanUpdate: _onPanUpdate,
        child: MouseRegion(
          onHover: _onMouseHover,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Transform(
              transform: Matrix4.identity()..setEntry(3, 0, (_mousePosition - 0.5) * 0.001),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: const Column(
                      children: [
                        CardAvatar(),
                        CardHeader(),
                        SizedBox(height: 16.0),
                        CardInfoRow(icon: Icon(Icons.phone), text: '+78005553535'),
                        SizedBox(height: 8.0),
                        CardInfoRow(icon: Icon(Icons.email), text: 'email@email.com'),
                        Spacer(),
                        CardFooter(),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Consumer<ShaderData?>(
                      builder: (content, data, _) {
                        if (data == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return CustomPaint(
                          painter: _LogoPainter(data.fragmentShader, data.image, _mousePosition),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  _LogoPainter(this.shader, this.image, this.mousePosition);

  final ui.FragmentShader shader;
  final ui.Image image;
  final double mousePosition;

  @override
  void paint(Canvas canvas, Size size) {
    shader
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, mousePosition)
      ..setImageSampler(0, image);

    canvas.drawRect(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
