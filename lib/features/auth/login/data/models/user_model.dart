import 'package:e_commerce_app_task/features/auth/login/domain/entities/user_entities.dart';

class UserModel extends UserEntity {
  const UserModel({required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token']);
  }

  Map<String, dynamic> toJson() => {'token': token};
}
