// screens/auth_wrapper.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_buddy_flutter/view/layout/main_layout.dart';
import '../providers/auth_provider.dart';
import 'auth/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.watch<AuthProvider>().isAuthenticated;

    if (isAuthenticated) {
      return const MainLayout(); // main app screen
    } else {
      return const LoginScreen(); // login/signup/forgot password
    }
  }
}
