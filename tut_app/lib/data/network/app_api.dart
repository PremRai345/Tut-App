import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tut_app/data/responses/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: "Constant.baseUrl")
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/custom/login")
  Future<AuthenticationResponse> login();
}
