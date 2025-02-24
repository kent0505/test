import 'package:dio/dio.dart';

import '../../../core/utils.dart';
import '../../../core/models/album.dart';

class AlbumApi {
  late Dio _dio;

  AlbumApi() {
    final options = BaseOptions(
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Authorization': 'Bearer $token',
      // },
      // receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    _dio = Dio(options);
  }

  Future<List<Album>> fetchAlbums() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/albums',
      );
      List data = response.data;
      List<Album> albums = data.map((json) {
        return Album.fromJson(json);
      }).toList();
      return albums;
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
