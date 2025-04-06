import 'package:clever_buddy/home/home.dart';
import 'package:clever_buddy/login/cubit/login_cubit.dart';
import 'package:clever_buddy/register/register.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isUnauthenticated) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Invalid email or password'),
                backgroundColor: ThemeColors.error,
              ),
            );
        } else if (state.isEmailNotVerified) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Email not verified'),
                backgroundColor: ThemeColors.error,
              ),
            );
        } else if (state.isError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.error ?? 'An unknown error occurred'),
                backgroundColor: ThemeColors.error,
              ),
            );
        } else if (state.isAuthenticated) {
          context.goNamed(HomePage.route);
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
                horizontal: 20.sp,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.sp,
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
                    Gap(15.sp),
                    CustomField(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                          size: 15.sp,
                        ),
                        onPressed: () =>
                            setState(() => obscureText = !obscureText),
                      ),
                      validator: (pass) {
                        if (pass == null || pass.isEmpty) {
                          return 'Password required';
                        }
                        return null;
                      },
                    ),
                    TextButton(
                      onPressed: () => context.replaceNamed(RegisterPage.route),
                      child: const Text("Don't have an account? Sign up"),
                    ),
                    const Spacer(flex: 2),
                    CustomButton(
                      onPressed: _onLogin,
                      text: 'Login',
                    ),
                    Gap(20.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!(formKey.currentState?.validate() ?? false)) return;

    await context.read<LoginCubit>().login(
          email: emailController.text,
          password: passwordController.text,
        );
  }
}
