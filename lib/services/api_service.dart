import 'package:dio/dio.dart';
import 'package:my_flights/models/offers_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('4286f1ae-b8a2-4c2b-8b66-3ee747d85647')
  Future<OffersModel> getOffers();
}

