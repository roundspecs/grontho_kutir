import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes.dart';
import '../../../../utils/show_snackbar.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/loader.dart';
import '../view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginScreen({super.key, required this.viewModel});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Title(
        color: Theme.of(context).colorScheme.primary,
        title: 'Sign In - গ্রন্থকুটির',
        child: Center(
          child: BlocConsumer<LoginViewModel, LoginState>(
            bloc: widget.viewModel,
            listenWhen: (previous, current) {
              return current is LoginFailure || current is LoginSuccess;
            },
            listener: (context, state) {
              if (state is LoginFailure) {
                context.showSnackBar(message: state.message, isError: true);
              } else if (state is LoginSuccess) {
                context.showSnackBar(message: state.message, isError: false);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return Loader(state.message);
              }
              return Padding(
                padding: Dimens.of(context).edgeInsetsScreenSymmetric,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: Dimens.maxWidth),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: Dimens.paddingHorizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back to গ্রন্থকুটির',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixText: 'u',
                            suffixText: '@student.cuet.ac.bd',
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 7,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ID';
                            } else if (value.length != 7 ||
                                !RegExp(r'^\d{7}$').hasMatch(value)) {
                              return 'ID must be 7 digits';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.viewModel.logIn(
                                email:
                                    'u${_emailController.text}@student.cuet.ac.bd',
                                password: _passwordController.text,
                              );
                            }
                          },
                          child: const Text('Sign In'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(Routes.register);
                          },
                          child: const Text('Don\'t have an account? Register'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
