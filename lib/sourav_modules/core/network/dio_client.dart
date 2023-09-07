import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class DioClient {
  DioClient._privateConstructor();

  static DioClient? _instance;

  static DioClient get instance =>
      _instance ??= DioClient._privateConstructor();

  static BaseOptions options = BaseOptions(
    baseUrl: 'https://dev.elred.io',
    connectTimeout: const Duration(milliseconds: 1200000),
    receiveTimeout: const Duration(milliseconds: 1200000),
    contentType: Headers.jsonContentType,
    validateStatus: (status) => true,
    headers: {
      'Authorization':
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiQkprdnk4VTh1N2QzbVltSUdNT2kwOVNSTktVMiIsImlhdCI6MTY5MzkxMjQ5MCwiZXhwIjoxNjk1MjA4NDkwfQ.ypgaYa0h6xrPU_NtZdGGzBBl0xXp_4vnyolKzJYsmqo'
    },
    responseType: ResponseType.json,
  );

  final _dio = Dio(options);

  Future<bool> postMultiPartImage(File file) async {
    String fileName = file.path.split('/').last;
    String fileExtnsn = fileName.split('.').last;
    FormData data = FormData.fromMap({
      "profileBannerImageURL": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType("image", fileExtnsn),
      ),
    });

    final response = await _dio.post('/postProfileBannerImage', data: data);

    if (response.statusCode == 200 && response.data['success']) {
      return true;
    } else {
      return false;
    }
  }
}
