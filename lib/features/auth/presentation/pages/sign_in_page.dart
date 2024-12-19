import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignInPage extends StatefulWidget {
  static const route = '/sign-in';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Theme.of(context).colorScheme.primary,
      title: "Sign In - Grontho Kutir",
      child: Scaffold(
        body: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            buildWhen: (previous, current) => current is! AuthFailure,
            listenWhen: (previous, current) => current is AuthFailure,
            listener: (context, state) {
              context.showSnackBar(message: (state as AuthFailure).message);
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator();
              }
              return Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(fontSize: 24),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _emailTextField(),
                          _passwordTextField(),
                          _signInButton(context),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(SignUpPage.route);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  FilledButton _signInButton(BuildContext context) {
    return FilledButton(
      child: Text('Sign In'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<AuthBloc>().add(
                AuthSignInWithEmailAndPasswordEvent(
                  email: idToEmail(_idController.text),
                  password: _passwordController.text,
                ),
              );
        }
      },
    );
  }

  TextFormField _emailTextField() {
    return TextFormField(
      controller: _idController,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixText: "u",
        suffixText: "@student.cuet.ac.bd",
      ),
      validator: idValidator,
      keyboardType: TextInputType.number,
    );
  }

  TextFormField _passwordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
      validator: passwordValidator,
    );
  }
}
