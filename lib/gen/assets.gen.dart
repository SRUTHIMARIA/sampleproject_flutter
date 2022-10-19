/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_back.png
  AssetGenImage get iconBack =>
      const AssetGenImage('assets/icons/icon_back.png');

  /// File path: assets/icons/icon_backarrow.svg
  String get iconBackarrow => 'assets/icons/icon_backarrow.svg';

  /// File path: assets/icons/icon_forward.png
  AssetGenImage get iconForward =>
      const AssetGenImage('assets/icons/icon_forward.png');

  /// List of all assets
  List<dynamic> get values => [iconBack, iconBackarrow, iconForward];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_addphoto.png
  AssetGenImage get imageAddphoto =>
      const AssetGenImage('assets/images/image_addphoto.png');

  /// File path: assets/images/image_aspiration.png
  AssetGenImage get imageAspiration =>
      const AssetGenImage('assets/images/image_aspiration.png');

  /// File path: assets/images/image_skillplan.png
  AssetGenImage get imageSkillplan =>
      const AssetGenImage('assets/images/image_skillplan.png');

  /// File path: assets/images/image_uploadphoto.png
  AssetGenImage get imageUploadphoto =>
      const AssetGenImage('assets/images/image_uploadphoto.png');

  /// File path: assets/images/image_user_review.png
  AssetGenImage get imageUserReview =>
      const AssetGenImage('assets/images/image_user_review.png');

  /// File path: assets/images/image_whoamI.png
  AssetGenImage get imageWhoamI =>
      const AssetGenImage('assets/images/image_whoamI.png');

  /// File path: assets/images/uploaded_image.png
  AssetGenImage get uploadedImage =>
      const AssetGenImage('assets/images/uploaded_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        imageAddphoto,
        imageAspiration,
        imageSkillplan,
        imageUploadphoto,
        imageUserReview,
        imageWhoamI,
        uploadedImage
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
