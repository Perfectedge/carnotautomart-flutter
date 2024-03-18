import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../local/pref_keys.dart';
import '../network/dio_provider.dart';
import '../network/error_handlers.dart';
import '../network/exceptions/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  final logger = Logger();

  final storage = GetStorage();

  // String getUserTempToken() {
  //   return storage.read(PrefKeys.tempUserToken);
  // }

  String getUserToken() {
    return storage.read(PrefKeys.accessToken);
  }

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      /* if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {}*/

      return response;
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
