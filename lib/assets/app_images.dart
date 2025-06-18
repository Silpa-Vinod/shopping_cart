import 'package:flutter/material.dart';

class AppImages {
  final Color? color;
  final double? height;
  final double? width;
  static const String _assetPath = 'lib/assets/images/';
  final BoxFit? fit;

  AppImages({this.color, this.height, this.width,this.fit});

  Image _build(String name) => Image.asset(
    '$_assetPath$name',
    color: color,
    height: height,
    width: width,
    fit: fit ?? BoxFit.contain,
  );

  Image get logo1 => _build('logo_one.png');
  Image get iPhoneBlack => _build('iphone_black.png');
  Image get iPhoneWhite => _build('iphone_white.png');
  Image get iPhoneGreen => _build('iphone_green.png');
  Image get smartTvOne => _build('smart_tv_one.png');
  Image get smartTvTwo => _build('smart_tv_two.png');
  Image get smartTvThree => _build('smart_tv_three.png');
  Image get bicycleBlue => _build('bicycle_blue.png');
  Image get bicycleGreen => _build('bicycle_green.png');
  Image get bicycleViolet => _build('bicycle_violet.png');
  Image get logo2 => _build('logo_two.png');
}
