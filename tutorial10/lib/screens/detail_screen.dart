import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailScrreen extends StatelessWidget {
  final String imagePath;

  const DetailScrreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: Center(
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          minScale: 1.0,
          maxScale: 4.0,

          child: kIsWeb
              ? Image.network(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 80,
                    );
                  },
                )
              : Image.file(
                  File(imagePath),
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}