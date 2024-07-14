import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUrl extends StatelessWidget {
  const ImageUrl({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const Placeholder(
        child: Text('              No Image Available.              '),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
  }
}
