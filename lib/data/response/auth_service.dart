import 'package:retrofit/retrofit.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart' hide Headers;

import '../models/user_model.dart';
part 'auth_service.g.dart';

@RestApi(
  baseUrl: "https://truyen-clone.getdata.one",
)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/register")
  Future<MongoResponse<UserModel>> signIn(@Body() Map<String, dynamic> user);
}


