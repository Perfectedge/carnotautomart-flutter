import 'package:carnotautomart/data/remote/model/service_model.dart';
import 'package:carnotautomart/ui/utils/helper/image_helper.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  List<ServiceModel> serviceList = [
    ServiceModel('Buy Car', AssetString.buyCar, () {}),
    ServiceModel('Import Car', AssetString.importCar, () {}),
    ServiceModel('Buy MotorBike', AssetString.motorBike, () {}),
    ServiceModel('Sell Products', AssetString.sellProduct, () {}),
    ServiceModel('Buy Spare Parts', AssetString.spareParts, () {}),
    ServiceModel('Hire Mechanic', AssetString.mechanic, () {}),
    ServiceModel('Mobile Mechanic', AssetString.mobileMechanic, () {}),
    ServiceModel('Driver Hire', AssetString.driver, () {}),
    ServiceModel('Online Mechanic', AssetString.onlineMecha, () {}),
    ServiceModel('Online Diagnostic', AssetString.onlineDiagn, () {}),
    ServiceModel('Ask Expert', AssetString.expart, () {}),
    ServiceModel('Finance', AssetString.finance, () {}),
    ServiceModel('Insurance', AssetString.insurance, () {}),
    ServiceModel('Car Valuation', AssetString.carValuation, () {}),
    ServiceModel('Track Application', AssetString.trackApplication, () {}),
    ServiceModel('Insurance Claims', AssetString.insuranceClaims, () {}),
  ];
}
