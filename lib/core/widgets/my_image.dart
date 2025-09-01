import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String imageUrl;
  final double? width;

  const MyImage({super.key, required this.imageUrl, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}
