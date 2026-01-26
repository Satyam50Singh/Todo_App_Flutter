import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/core/theme/pallete.dart';
import 'package:auth_app/core/utils/snackbar_utils.dart';
import 'package:auth_app/features/auth/register/presentation/pages/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/gradient_button.dart';
import '../widgets/login_field.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              listener: (context, state) {
                if (state is AuthFailure) {
                  CustomSnackBar.showCustomSnackBar(
                    context,
                    false,
                    state.errorMessage ?? 'Login Failed!',
                  );
                }

                if (state is AuthSuccess) {
                  CustomSnackBar.showCustomSnackBar(
                    context,
                    true,
                    state.message ?? 'Login Successfully!',
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.todoListScreen,
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset('assets/images/sign_in_balls.png'),
                            const Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            const SocialButton(
                              iconPath: 'assets/svgs/f_logo.svg',
                              labelText: 'Continue with Facebook',
                              horizontalPadding: 80,
                            ),
                            const SizedBox(height: 15),
                            const SocialButton(
                              iconPath: "assets/svgs/g_logo.svg",
                              labelText: 'Continue with Google',
                            ),
                            const SizedBox(height: 15),
                            const Text("Or", style: TextStyle(fontSize: 17)),
                            const SizedBox(height: 15),
                            LoginField(
                              hintText: 'Email',
                              controller: _emailController,
                              isPassword: false,
                            ),
                            const SizedBox(height: 15),
                            LoginField(
                              hintText: 'Password',
                              controller: _passwordController,
                              isPassword: true,
                            ),
                            const SizedBox(height: 30),
                            GradientButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthLoginRequested(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?"),
                                SizedBox(width: 5),
                                InkWell(
                                  child: Text(
                                    'Register now',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      CupertinoPageRoute(
                                        builder: (_) => const RegisterScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (state is AuthLoading)
                      Positioned.fill(
                        child: AbsorbPointer(
                          absorbing: true,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
