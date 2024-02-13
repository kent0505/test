import 'package:dio/dio.dart';

import '../../core/models/trip.dart';
import '../../core/result.dart';

class HomeRepository {
  final dio = Dio();

  Future<Result> fetchTrips(
    String departure,
    String destination,
    String date,
  ) async {
    try {
      final response = await dio.get(
        'https://bibiptrip.com/api/avibus/search_trips_cities/?departure_city=$departure&destination_city=$destination&date=$date',
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data['trips']);
        final List result = response.data['trips'];
        final trips = result.map((item) => Trip.fromJson(item)).toList();
        print(trips.length);

        return SuccessResult(trips);
      } else {
        return ErrorResult(
          response.data['detail'],
          response.statusCode!,
        );
      }
    } catch (e) {
      print(e);
      return ServerErrorResult();
    }
  }
}
