import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.sp,
            horizontal: 30.sp,
          ),
          child: const Column(
            children: [
              Text('Login'),
              CustomField(),
              CustomField(),
            ],
          ),
        ),
      ),
    );
  }
}
