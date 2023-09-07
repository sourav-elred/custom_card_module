import 'dart:io';

import 'package:custom_card_module/sourav_modules/core/network/dio_client.dart';

class CustomCardService {
  final _dio = DioClient.instance;

  Future<bool> postBannerImage(String path) async {
    try {
      final file = File(path);
      final response = await _dio.postMultiPartImage(file);

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
