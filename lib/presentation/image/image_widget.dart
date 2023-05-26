import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.image, this.size = 24})
      : super(key: key);

  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: size,
      width: size,
    );
  }
}
