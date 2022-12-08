import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/utilis/assets_manager.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(this._imageUrl, {super.key, this.color, this.width});

  final String _imageUrl;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      color: color,
      imageUrl: _imageUrl,
      colorBlendMode: BlendMode.dstATop,
      fit: BoxFit.cover,
      width: width,
      placeholder: (context, url) => Image.asset(
        AssetManager.placeholder,
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, _) => Image.asset(
        AssetManager.placeholder,
        fit: BoxFit.cover,
      ),
    );
  }
}

