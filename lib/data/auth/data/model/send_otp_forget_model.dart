import 'package:json_annotation/json_annotation.dart';

part 'send_otp_forget_model.g.dart';

@JsonSerializable()
class SendOtpForgetModel {
  @JsonKey(name: "email")
  String email;

  SendOtpForgetModel({required this.email});

  factory SendOtpForgetModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpForgetModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpForgetModelToJson(this);
}
