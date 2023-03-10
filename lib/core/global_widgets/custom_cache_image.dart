import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CustomCacheImage extends StatelessWidget {
  const CustomCacheImage({
    super.key,
    this.width = 20,
    this.height = 20,
    required this.path,
    this.fit,
  });

  final double width;
  final double height;
  final String path;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ExtendedImage.network(
        path,
        width: width,
        height: height,
        cache: true,
        fit: fit,
      ),
    );
  }
}
