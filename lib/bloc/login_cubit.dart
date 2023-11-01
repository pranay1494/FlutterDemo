import 'package:bloc/bloc.dart';
import 'package:flutterautos/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repo}) : super(LoginInitialised());

  final LoginRepository repo;

  void loginWithPassword(String name, String password) async {
    try {
      emit(LoginInitiated());
      final data = await repo.loginWithPassword(name: name, password: password);
      emit(LoginSuccessful(accessToken: data));
    } catch (ex) {
      emit(LoginFailedWithError(error: ex.toString()));
    }
  }

  shouldBuild(LoginState current) =>
      (current is LoginInitialised || current is LoginInitiated ||
          current is LoginFailedWithError);
}
