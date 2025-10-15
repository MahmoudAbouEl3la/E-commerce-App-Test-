import 'package:e_commerce_app_task/features/auth/login/data/models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login(String username, String password);
}
