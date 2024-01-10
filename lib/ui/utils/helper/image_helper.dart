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
  static String drawerHome = 'assets/icons/ic_home1.svg';
  static String account = 'assets/icons/ic_account.svg';
  static String calender = 'assets/icons/ic_calender.svg';
  static String document = 'assets/icons/ic_carbon_document.svg';
  static String chat = 'assets/icons/ic_chat.svg';
  static String contact = 'assets/icons/ic_contact.svg';
  static String rateUs = 'assets/icons/ic_rateus.svg';
  static String share = 'assets/icons/ic_share.svg';
  static String email = 'assets/icons/ic_email.svg';
  static String lock = 'assets/icons/ic_lock.svg';
}

class ImageHelper {
  ImageHelper._();

  static final icLogo = SvgPicture.asset(AssetString.logo);
  static final icdrawerHome = SvgPicture.asset(AssetString.drawerHome);
  static final icAccount = SvgPicture.asset(AssetString.account);
  static final icCalender = SvgPicture.asset(AssetString.calender);
  static final icDocument = SvgPicture.asset(AssetString.document);
  static final icChat = SvgPicture.asset(AssetString.chat);
  static final icContact = SvgPicture.asset(AssetString.contact);
  static final icRateUs = SvgPicture.asset(AssetString.rateUs);
  static final icShare = SvgPicture.asset(AssetString.share);
  static final icEmail = SvgPicture.asset(AssetString.email);
  static final icLock = SvgPicture.asset(AssetString.lock);
}
