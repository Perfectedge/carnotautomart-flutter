import 'package:flutter_svg/svg.dart';

class AssetString {
  AssetString._();
  static String logo = 'assets/icons/ic_logo.svg';
  static String buyCar = 'assets/images/new-car@3x.png';
  static String importCar = 'assets/images/import-car@3x.png';
  static String motorBike = 'assets/images/buy-motorbike@3x.png';
  static String sellProduct = 'assets/images/sell-my-car@3x.png';
  static String spareParts = 'assets/images/spare-parts@3x.png';
  static String mechanic = 'assets/images/hire-mechanic@3x.png';
  static String mobileMechanic = 'assets/images/mobile-mechanic@3x.png';
  static String driver = 'assets/images/driver-hire@3x.png';
  static String onlineMecha = 'assets/images/online-mechanic@3x.png';
  static String onlineDiagn = 'assets/images/online-diagnostic@3x.png';
  static String expart = 'assets/images/ask-expert@3x.png';
  static String finance = 'assets/images/loan@3x.png';
  static String insurance = 'assets/images/insurance@3x.png';
  static String carValuation = 'assets/images/car-valuations@3x.png';
  static String trackApplication = 'assets/images/track-application@3x.png';
  static String insuranceClaims = 'assets/images/insurance-claims@3x.png';
}

class ImageHelper {
  ImageHelper._();

  static final icLogo = SvgPicture.asset(AssetString.logo);
}
