import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/core/utils/snackbar_utils.dart';
import 'package:auth_app/features/auth/register/presentation/widgets/register_field.dart';
import 'package:auth_app/features/auth/register/presentation/widgets/register_redirect_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/pallete.dart';
import '../../../../../core/widgets/circular_loader.dart';
import '../../../login/presentation/bloc/auth_bloc.dart';
import '../../../login/presentation/pages/login_screen.dart';
import '../../../login/presentation/widgets/gradient_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // keeps background clean
        statusBarIconBrightness: Brightness.light, // ANDROID icons
        statusBarBrightness: Brightness.dark, // IOS icons
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Theme(
        data: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        child: Scaffold(
          backgroundColor: Pallete.backgroundColor,
          body: SafeArea(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (BuildContext context, AuthState state) {
                if (state is AuthFailure) {
                  CustomSnackBar.showCustomSnackBar(
                    context,
                    false,
                    state.errorMessage ?? 'User Registration Failed!',
                  );
                }

                if (state is AuthRegisterSuccess) {
                  CustomSnackBar.showCustomSnackBar(
                    context,
                    true,
                    state.message ?? 'Registration Successful!',
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.loginScreen,
                    (route) => false,
                  );
                }
              },
              builder: (BuildContext context, AuthState state) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Image.asset('assets/images/sign_in_balls.png'),
                              const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              RegisterField(
                                hintText: 'Username',
                                controller: _usernameController,
                                isPassword: false,
                                icon: const Icon(Icons.person),
                              ),
                              const SizedBox(height: 16),
                              RegisterField(
                                hintText: 'Email',
                                controller: _emailController,
                                isPassword: false,
                                icon: const Icon(Icons.email),
                              ),
                              const SizedBox(height: 16),
                              RegisterField(
                                hintText: 'Password',
                                controller: _passwordController,
                                isPassword: true,
                                icon: const Icon(Icons.lock),
                              ),
                              const SizedBox(height: 16),
                              RegisterField(
                                hintText: 'Confirm password',
                                controller: _confirmPasswordController,
                                isPassword: true,
                                icon: const Icon(Icons.lock),
                              ),

                              const SizedBox(height: 30),
                              GradientButton(
                                buttonText: 'Register',
                                onPressed: () => _doRegister(),
                              ),

                              const SizedBox(height: 20),
                              RegisterRedirectText(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    CupertinoPageRoute(
                                      builder: (_) => const LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (state is AuthLoading) CircularLoader(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _doRegister() {
    if (_usernameController.text.isEmpty) {
      return CustomSnackBar.showCustomSnackBar(
        context,
        false,
        'Username cannot be empty',
      );
    }
    if (_emailController.text.isEmpty) {
      return CustomSnackBar.showCustomSnackBar(
        context,
        false,
        'Email cannot be empty',
      );
    }
    if (_passwordController.text.isEmpty) {
      return CustomSnackBar.showCustomSnackBar(
        context,
        false,
        'Password cannot be empty',
      );
    }
    if (_confirmPasswordController.text.isEmpty) {
      return CustomSnackBar.showCustomSnackBar(
        context,
        false,
        'Confirm password cannot be empty',
      );
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return CustomSnackBar.showCustomSnackBar(
        context,
        false,
        'Passwords do not match',
      );
    }

    BlocProvider.of<AuthBloc>(context).add(
      AuthRegisterRequested(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        fullName: '',
        mobileNumber: '',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
