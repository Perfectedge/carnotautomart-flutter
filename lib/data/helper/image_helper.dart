import 'package:flutter_svg/svg.dart';

class AssetString {
  AssetString._();
  static  String logo = 'assets/icons/ic_logo.svg';
}

class ImageHelper {
  ImageHelper._();

 static final  icLogo = SvgPicture.asset(AssetString.logo);
}
