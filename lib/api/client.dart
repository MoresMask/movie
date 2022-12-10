import 'package:dio/dio.dart';
import 'package:movies2/config.dart';
import '../models/movie.dart';
import 'package:retrofit/retrofit.dart';
part 'client.g.dart';

@RestApi(baseUrl: AppConstants.main)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  @GET("/premiummovies")
  Future<List<Movie>> getMovie();
}
