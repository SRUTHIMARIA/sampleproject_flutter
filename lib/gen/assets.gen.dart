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

  /// File path: assets/icons/backarrow.svg
  String get backarrow => 'assets/icons/backarrow.svg';
  /// File path: assets/icons/icon_back.png
  AssetGenImage get iconBack =>
      const AssetGenImage('assets/icons/icon_back.png');

  /// File path: assets/icons/icon_backarrow.svg
  String get iconBackarrow => 'assets/icons/icon_backarrow.svg';

  /// File path: assets/icons/icon_forward.svg
  String get iconForward => 'assets/icons/icon_forward.svg';

  /// File path: assets/icons/icon_forward.png
  AssetGenImage get iconForward =>
      const AssetGenImage('assets/icons/icon_forward.png');

  /// File path: assets/icons/icon_backarrow.svg
  String get iconBackarrow => 'assets/icons/icon_backarrow.svg';

  /// List of all assets
  List<String> get values => [backarrow, iconForward];
  List<dynamic> get values => [iconBack, iconBackarrow, iconForward];
  List<dynamic> get values => [iconBack, iconBackarrow];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_physio.png
  AssetGenImage get imagePhysioPng =>
      const AssetGenImage('assets/images/image_physio.png');
  /// File path: assets/images/children.png
  AssetGenImage get childrenPng =>
      const AssetGenImage('assets/images/children.png');

  /// File path: assets/images/children.svg
  String get childrenSvg => 'assets/images/children.svg';

  /// File path: assets/images/image_athelete.png
  AssetGenImage get imageAtheletePng =>
      const AssetGenImage('assets/images/image_athelete.png');

  /// File path: assets/images/image_athelete.svg
  String get imageAtheleteSvg => 'assets/images/image_athelete.svg';

  /// File path: assets/images/old.png
  AssetGenImage get oldPng => const AssetGenImage('assets/images/old.png');

  /// File path: assets/images/old.svg
  String get oldSvg => 'assets/images/old.svg';

  /// File path: assets/images/sports_afl.svg
  String get sportsAfl => 'assets/images/sports_afl.svg';

  /// File path: assets/images/sports_batminton.svg
  String get sportsBatminton => 'assets/images/sports_batminton.svg';

  /// File path: assets/images/sports_cricket.svg
  String get sportsCricket => 'assets/images/sports_cricket.svg';

  /// File path: assets/images/sports_gynastic.svg
  String get sportsGynastic => 'assets/images/sports_gynastic.svg';

  /// File path: assets/images/sports_netball.svg
  String get sportsNetball => 'assets/images/sports_netball.svg';
  /// File path: assets/images/image_addphoto.png
  AssetGenImage get imageAddphoto =>
      const AssetGenImage('assets/images/image_addphoto.png');

  /// File path: assets/images/image_uploadphoto.png
  AssetGenImage get imageUploadphoto =>
      const AssetGenImage('assets/images/image_uploadphoto.png');

  /// File path: assets/images/sports_ruby.svg
  String get sportsRuby => 'assets/images/sports_ruby.svg';
  /// File path: assets/images/image_user_review.png
  AssetGenImage get imageUserReview =>
      const AssetGenImage('assets/images/image_user_review.png');

  /// File path: assets/images/sports_ruby_league.svg
  String get sportsRubyLeague => 'assets/images/sports_ruby_league.svg';

  /// File path: assets/images/sports_running.svg
  String get sportsRunning => 'assets/images/sports_running.svg';

  /// File path: assets/images/sports_soccer.svg
  String get sportsSoccer => 'assets/images/sports_soccer.svg';

  /// File path: assets/images/sports_swimming.svg
  String get sportsSwimming => 'assets/images/sports_swimming.svg';

  /// File path: assets/images/image_physio.svg
  String get imagePhysioSvg => 'assets/images/image_physio.svg';
  /// File path: assets/images/sports_tennis.svg
  String get sportsTennis => 'assets/images/sports_tennis.svg';

  /// File path: assets/images/sports_touchball.svg
  String get sportsTouchball => 'assets/images/sports_touchball.svg';

  /// File path: assets/images/teen.png
  AssetGenImage get teenPng => const AssetGenImage('assets/images/teen.png');

  /// File path: assets/images/teen.svg
  String get teenSvg => 'assets/images/teen.svg';

  /// File path: assets/images/young.png
  AssetGenImage get young => const AssetGenImage('assets/images/young.png');
  /// File path: assets/images/image_whoamI.png
  AssetGenImage get imageWhoamI =>
      const AssetGenImage('assets/images/image_whoamI.png');

  /// File path: assets/images/uploaded_image.png
  AssetGenImage get uploadedImage =>
      const AssetGenImage('assets/images/uploaded_image.png');

  /// List of all assets
  List<dynamic> get values => [imagePhysioPng, imagePhysioSvg];
  List<dynamic> get values => [
        childrenPng,
        childrenSvg,
        imageAtheletePng,
        imageAtheleteSvg,
        oldPng,
        oldSvg,
        sportsAfl,
        sportsBatminton,
        sportsCricket,
        sportsGynastic,
        sportsNetball,
        sportsRuby,
        sportsRubyLeague,
        sportsRunning,
        sportsSoccer,
        sportsSwimming,
        sportsTennis,
        sportsTouchball,
        teenPng,
        teenSvg,
        young
      ];
  List<AssetGenImage> get values => [
        imageAddphoto,
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
