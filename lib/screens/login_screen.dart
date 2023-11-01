import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterautos/bloc/login_cubit.dart';
import 'package:flutterautos/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterautos/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final LoginCubit _loginCubit;

  void _submitCredentials() {
    if (_formKey.currentState?.validate() ?? false) {
      print("validated");
      _loginCubit.loginWithPassword("name", "password");
    }
  }

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(contentType: "application/json"));
    _loginCubit = LoginCubit(repo: LoginRepositoryImpl(dio: dio));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ("Login"),
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: _loginCubit,
        buildWhen: (previous, current) => _loginCubit.shouldBuild(current),
        listener: (context, state) {
          if (state is LoginSuccessful) {
            print("access token ${state.accessToken}");
            // navigate to home screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const HomeScreen(),
              ),
            );
          } else if (state is LoginFailedWithError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginInitiated:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.person),
                          hintText: 'Enter your Name',
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return 'Name is required';
                          }
                          return null; //by default should be null to indicate success
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.password),
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          print("Submit clicked");
                          _submitCredentials();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
