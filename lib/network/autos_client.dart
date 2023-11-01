import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutterautos/models/LoginResponse.dart';

part 'autos_client.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ApiClient{

  factory ApiClient(Dio dio) = _ApiClient;


  @GET("b5eb4adc-180f-4a6d-967d-52532d0e23ee")
  Future<LoginResponse> loginWithPassword();
}