import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/core/startup/app_startup.dart';
import 'package:auth_app/core/theme/pallete.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppStartup _appStartup;

  @override
  void initState() {
    super.initState();
    _appStartup = AppStartup();

    _start();
  }

  Future<void> _start() async {
    final isAuth = await _appStartup.isAuthenticated();

    if (!mounted) return; // Check if the widget is still mounted

    Navigator.pushNamedAndRemoveUntil(
      context,
      isAuth ? RouteName.todoListScreen : RouteName.loginScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor, // Dark modern background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // App Icon
              CircleAvatar(
                radius: 45,
                backgroundColor: Pallete.gradient1,
                child: Icon(
                  Icons.edit_note_rounded,
                  size: 48,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 24),

              Text(
                'Todo App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 6),

              Text(
                'Built with Flutter',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),

              SizedBox(height: 40),

              // Loader
              CircularProgressIndicator(
                strokeWidth: 3.5,
                color: Pallete.gradient1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
