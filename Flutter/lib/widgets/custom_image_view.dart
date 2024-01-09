import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageView extends StatelessWidget {
  final Alignment? alignment;
  final BoxBorder? border;
  final BorderRadius? radius;
  final BoxFit? fit;
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final String? imagePath;
  final VoidCallback? onTap;
  final String placeHolder;

  CustomImageView({
    this.alignment,
    this.border,
    this.color,
    this.fit,
    this.height,
    this.imagePath,
    this.margin,
    this.onTap,
    this.radius,
    this.width,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null ? Align(alignment: alignment!, child: _buildWidget()) : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(padding: margin ?? EdgeInsets.zero, child: InkWell(onTap: onTap, child: _buildCircleImage()));
  }

  Widget _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(borderRadius: radius!, child: _buildImageWithBorder());
    } else {
      return _buildImageWithBorder();
    }
  }

  Widget _buildImageWithBorder() {
    if (border != null) {
      return Container(decoration: BoxDecoration(border: border, borderRadius: radius), child: _buildImageView());
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return Container(
            height: height,
            width: width,
            child: SvgPicture.asset(imagePath!, height: height, width: width, fit: fit ?? BoxFit.contain, color: color),
          );

        case ImageType.file:
          return Image.file(File(imagePath!), height: height, width: width, fit: fit ?? BoxFit.cover, color: color);

        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            color: color,
            placeholder: (context, url) => Container(
              height: 30,
              width: 30,
              child: LinearProgressIndicator(color: Colors.white, backgroundColor: Colors.white),
            ),
            errorWidget: (context, url, error) => Image.asset(placeHolder, height: height, width: width, fit: fit ?? BoxFit.cover),
          );
        case ImageType.png:
        default:
          return Image.asset(imagePath!, height: height, width: width, fit: fit ?? BoxFit.cover, color: color);
      }
    }
    return SizedBox();
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown }
