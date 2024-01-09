import 'package:carnotautomart/ui/utils/helper/image_helper.dart';
import 'package:get/get.dart';

import '../../../data/remote/model/service_model.dart';

class HomeController extends GetxController {
  List<ServiceModel> homeServiceList = [
    ServiceModel('Buy Car',  AssetString.buyCar, () {}),
    ServiceModel('Sell Products',  AssetString.sellProduct, () {}),
    ServiceModel('Import Car',  AssetString.importCar, () {}),
    ];
}

