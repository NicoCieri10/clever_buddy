import 'package:clever_buddy/login/login.dart';
import 'package:clever_buddy/register/register.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const route = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final password0Controller = TextEditingController();
  final password1Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool obscureText0 = true;
  bool obscureText1 = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.isEmailAlreadyInUse) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Email already in use'),
                backgroundColor: ThemeColors.error,
              ),
            );
        }

        if (state.isError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.error ?? 'An unknown error occurred'),
                backgroundColor: ThemeColors.error,
              ),
            );
        }

        if (state.isRegistered) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Registered successfully'),
                backgroundColor: ThemeColors.success,
              ),
            );
          context.goNamed(LoginPage.route);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: ThemeColors.primary[50],
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 30.sp,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    CustomField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Email required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),
                    CustomField(
                      hintText: 'Password',
                      controller: password0Controller,
                      obscureText: obscureText0,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText0
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 15.sp,
                        ),
                        onPressed: () =>
                            setState(() => obscureText0 = !obscureText0),
                      ),
                      validator: (pass) {
                        if (pass == null || pass.isEmpty) {
                          return 'Password required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),
                    CustomField(
                      hintText: 'Confirm Password',
                      controller: password1Controller,
                      obscureText: obscureText1,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 15.sp,
                        ),
                        onPressed: () =>
                            setState(() => obscureText1 = !obscureText1),
                      ),
                      validator: (pass) {
                        if (pass == null || pass.isEmpty) {
                          return 'Confirm password';
                        }

                        if (pass != password0Controller.text) {
                          return 'Passwords do not match';
                        }

                        return null;
                      },
                    ),
                    TextButton(
                      onPressed: () => context.replaceNamed(LoginPage.route),
                      child: const Text('Already have an account? Log in'),
                    ),
                    const Spacer(),
                    CustomButton(
                      onPressed: onRegister,
                      text: 'Sign Up',
                    ),
                    const Spacer(flex: 6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onRegister() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!(formKey.currentState?.validate() ?? false)) return;

    await context.read<RegisterCubit>().register(
          email: emailController.text,
          password: password0Controller.text,
        );
  }
}
