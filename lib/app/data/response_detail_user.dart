import 'package:dumy_user/app/data/response_list_user.dart';

class ResponseDetailUser {
  User? data;
  Support? support;

  ResponseDetailUser({
    this.data,
    this.support,
  });

  factory ResponseDetailUser.fromJson(Map<String, dynamic> json) => ResponseDetailUser(
        data: json["data"] == null ? null : User.fromJson(json["data"]),
        support: json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "support": support?.toJson(),
      };
}
