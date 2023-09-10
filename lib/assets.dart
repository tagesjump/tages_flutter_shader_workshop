import 'dart:ui';

import 'package:flutter/material.dart' show decodeImageFromList;
import 'package:flutter/services.dart';

class ShaderData {
  const ShaderData(this.fragmentShader, this.image);

  final FragmentShader fragmentShader;
  final Image image;
}

Future<ShaderData> loadShader() async {
  final fragmentProgram = await FragmentProgram.fromAsset('assets/shaders/shader.frag');

  final imageData = await rootBundle.load('assets/images/logo.png');
  final image = await decodeImageFromList(imageData.buffer.asUint8List());

  return ShaderData(fragmentProgram.fragmentShader(), image);
}
