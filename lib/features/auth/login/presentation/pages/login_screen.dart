import 'package:auth_app/core/theme/pallete.dart';
import 'package:auth_app/features/auth/login/presentation/widgets/gradient_button.dart';
import 'package:auth_app/features/auth/login/presentation/widgets/login_field.dart';
import 'package:auth_app/features/auth/login/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
          body: SafeArea(
            child: SingleChildScrollView(
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
                      iconPath: 'assets/svgs/f_logo.s vg',
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
                    LoginField(hintText: 'Email', controller: emailController),
                    const SizedBox(height: 15),
                    LoginField(
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(height: 30),
                    GradientButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
