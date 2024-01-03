import 'package:carnotautomart/data/remote/datasource/carnotautomart_remote_data_source.dart';
import 'package:get/get.dart';

import '../datasource/carnotautomart_remote_data_source_impl.dart';
import 'carnotmart_repository.dart';

class CarnotMartRepositoryImpl implements CarnotMartRepository {
  final CarnotMartRemoteDataSource _dataSource = Get.put(CarnotMartRemoteDataSourceImpl());

}
