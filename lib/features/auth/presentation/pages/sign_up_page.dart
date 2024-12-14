import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignUpPage extends StatefulWidget {
  static const route = '/sign-up';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const Text(
              'Create an account to get started',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: nameValidator,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _idController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixText: "u",
                        suffixText: "@student.cuet.ac.bd",
                      ),
                      validator: idValidator,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUpWithEmailAndPassword(
                                  name: _nameController.text,
                                  email: idToEmail(_idController.text),
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignInPage.route);
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
