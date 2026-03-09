import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "phone")
    String phone;
    @JsonKey(name: "password")
    String password;
    @JsonKey(name: "role")
    String role;

    RegisterModel({
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        required this.role,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

    Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
