import 'package:e_commerce_app_task/core/utilies/api_service.dart';
import 'package:e_commerce_app_task/features/auth/login/data/data_source/remote_data_source/login_remote_data_source.dart';
import 'package:e_commerce_app_task/features/auth/login/data/models/user_model.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiServise;
  LoginRemoteDataSourceImpl({required this.apiServise});
  @override
  Future<UserModel> login(String username, String password) async {
    final respone = await apiServise.login(
      username: username,
      password: password,
    );
    return UserModel.fromJson(respone);
  }
}
