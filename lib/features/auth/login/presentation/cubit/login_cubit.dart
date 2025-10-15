import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_task/core/constans/hive_constans.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/use_case/login_params.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/cubit/login_state.dart';
import 'package:hive_flutter/adapters.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    final failureOrUser = await loginUseCase.call(
      LoginParams(username: username, password: password),
    );
    failureOrUser.fold(
      (failure) => emit(LoginError(errorMessage: failure.message)),
      (userEntity) async {
        final authBox = Hive.box(kHiveBoxAuthToken);
        await authBox.put(kHiveToken, userEntity.token);
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }
}
