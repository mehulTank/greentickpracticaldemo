import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:greentickpracticaldemo/utils/constants/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ImageShape { CIRCLE, RECTANGLE }

class AppImageView extends StatelessWidget {
  const AppImageView({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.isBorder = false,
    this.isUrl,
    this.shape,
    this.borderColor = Colors.transparent,
    this.file,
    this.fit,
  }) : super(key: key);

  final String url;
  final isBorder;
  final isUrl;
  final double width;
  final double height;
  final Color borderColor;
  final BoxFit? fit;

  final ImageShape? shape;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return getImage();
  }

  Widget getImage() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: shape == ImageShape.CIRCLE
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: isBorder != null
                  ? Border.all(color: borderColor)
                  : Border.all(color: Colors.transparent),
            )
          : BoxDecoration(
              shape: BoxShape.rectangle,
              border: isBorder != null
                  ? Border.all(color: borderColor)
                  : Border.all(color: Colors.transparent),
            ),
      child: isUrl != null ? getUrlImage() : getLocalImage(),
    );
  }

  Widget getLocalImage() {
    return SizedBox(
      width: width,
      height: height,
      child: shape == ImageShape.CIRCLE
          ? ClipOval(
              child: file == null
                  ? Image.asset(
                      url,
                      fit: BoxFit.contain,
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
            )
          : Image.asset(
              url,
              fit: BoxFit.contain,
            ),
    );
  }

  Widget getUrlImage() {
    return SizedBox(
      width: width,
      height: height,
      child: shape == ImageShape.CIRCLE
          ? ClipOval(
              child: url == null
                  ? Image.asset(
                      AppConst.assets.imgAppLogo,
                      fit: BoxFit.contain,
                    )
                  : _buildNetworkImage(
                      url,
                      fit: (fit == null) ? BoxFit.fill : fit!,
                    ),
            )
          : url == null
              ? Image.asset(
                  AppConst.assets.imgAppLogo,
                  fit: BoxFit.contain,
                )
              : _buildNetworkImage(
                  url,
                  fit: BoxFit.fill,
                ),
    );
  }

  Widget _buildNetworkImage(url, {required BoxFit fit}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      placeholder: (context, url) => Container(
        margin: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Container(
          height: 16.0,
          width: 16.0,
          alignment: Alignment.center,
          child: CupertinoActivityIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        AppConst.assets.imgAppLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
