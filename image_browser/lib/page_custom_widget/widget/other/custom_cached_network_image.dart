import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/common_enums.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCachedNetworkImage extends CachedNetworkImage {
  CustomCachedNetworkImage(
    String? imageUrl, {
    final double? width,
    final double? height,
    final PlaceholderWidgetBuilder? placeholder,
    final LoadingErrorWidgetBuilder? errorWidget,
    final fit = BoxFit.cover,
    ImageSizeEnum? sizeEnum,
    int? memCacheWidth,
    int? memCacheHeight,
  }) : super(
          imageUrl: "$imageUrl${sizeEnum != null ? sizeEnum.value : ''}",
          width: width,
          height: height,
          placeholder: placeholder ??
              (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: colorTheme,
                  ),
                );
              },
          errorWidget: errorWidget ??
              (context, url, error) =>
                  Image.asset(ImageSourceConst.IC_IMAGE_DEFAUT, width: width ?? 24, height: height ?? 24),
          fit: fit,
          memCacheWidth: memCacheWidth,
          memCacheHeight: memCacheHeight,
          cacheManager: CustomCacheManager(),
        );
}

class CustomCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._() : super(Config(key, maxNrOfCacheObjects: 100));
}
