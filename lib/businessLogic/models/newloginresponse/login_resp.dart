// login_resp.dart
// repo: https://github.com/januwA/p5_object_2_builtvalue
// generate: https://januwa.github.io/p5_object_2_builtvalue/index.html

library login_resp;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../serializers.dart';

part 'login_resp.g.dart';

// {"id":1,"username":"emilys","email":"emily.johnson@x.dummyjson.com","firstName":"Emily","lastName":"Johnson","gender":"female","image":"https://dummyjson.com/icon/emilys/128","accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."}


/// LoginResp
abstract class LoginResp implements Built<LoginResp, LoginRespBuilder> {
  LoginResp._();

  factory LoginResp([Function(LoginRespBuilder b) updates]) = _$LoginResp;


  @BuiltValueField(wireName: 'id')
  int? get id;


  @BuiltValueField(wireName: 'username')
  String? get username;


  @BuiltValueField(wireName: 'email')
  String? get email;


  @BuiltValueField(wireName: 'firstName')
  String? get firstName;


  @BuiltValueField(wireName: 'lastName')
  String? get lastName;


  @BuiltValueField(wireName: 'gender')
  String? get gender;


  @BuiltValueField(wireName: 'image')
  String? get image;


  @BuiltValueField(wireName: 'accessToken')
  String? get accessToken;


  @BuiltValueField(wireName: 'refreshToken')
  String? get refreshToken;


  String? toJson() {
    return jsonEncode(serializers.serializeWith(LoginResp.serializer, this));
  }

  static LoginResp fromJson(String jsonString) {
    return serializers.deserializeWith(
        LoginResp.serializer, jsonDecode(jsonString))!.rebuild(
            (b) => b..id ??= 0
          ..username ??= ''
          ..email ??= ''
          ..firstName ??= ''
          ..lastName ??= ''
          ..gender ??= ''
          ..image ??= ''
          ..accessToken ??= ''
          ..refreshToken ??= ''
    );
  }

  static List<LoginResp> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<LoginResp>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<LoginResp> get serializer => _$loginRespSerializer;
}