import 'package:dio/dio.dart';
import 'package:flutterautos/network/autos_client.dart';

class LoginRepositoryImpl implements LoginRepository {
  // @override
  // Future<String> loginWithPassword(
  //     {required String name, required String password}) async {
  //   await Future.delayed(const Duration(seconds: 3)); // Simulate a 3-second delay
  //   return "Pranay"; // Simulate a successful login with a result
  // }

  Dio dio;
  late ApiClient apiClient;

  LoginRepositoryImpl({required this.dio}) {
    apiClient = ApiClient(dio);
  }

  @override
  Future<String> loginWithPassword(
      {required String name, required String password}) async {
    final data = await apiClient.loginWithPassword();
    return data.accessToken ?? "";
  }
}

abstract class LoginRepository {
  Future<String> loginWithPassword(
      {required String name, required String password});
}
