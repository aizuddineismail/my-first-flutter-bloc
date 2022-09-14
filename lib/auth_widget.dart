import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_exam/cubits/auth_cubit/auth_cubit.dart';
import 'package:map_exam/home_screen.dart';
import 'package:map_exam/login_screen.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthCubit>().authRepository.user,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      }),
    );
  }
}
