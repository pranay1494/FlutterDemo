/// accessToken : "abcdefghijklmnopqrstuvwxyz"
/// refreshToken : "hellofromrefreshtoken"

import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "accessToken")
  String accessToken;
  @JsonKey(name: "refreshToken")
  String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
