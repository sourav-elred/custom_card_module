import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class CustomCardService {
// https://dev.elred.io/postProfileBannerImage

  Future<Response> postBannerImage(String path) async {
    try {
      final file = File(path);

      String fileName = file.path.split('/').last;
      String fileExtnsn = fileName.split('.').last;
      FormData data = FormData.fromMap({
        "profileBannerImageURL": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType("image", fileExtnsn),
        ),
      });

      final response = await Dio().post(
        'https://dev.elred.io/postProfileBannerImage',
        options: Options(
          headers: {
            'authorization':
                'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiQkprdnk4VTh1N2QzbVltSUdNT2kwOVNSTktVMiIsImlhdCI6MTY5MzkxMjQ5MCwiZXhwIjoxNjk1MjA4NDkwfQ.ypgaYa0h6xrPU_NtZdGGzBBl0xXp_4vnyolKzJYsmqo',
          },
        ),
        data: data,
      );

      print('status code ==> ${response.statusCode}');

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
