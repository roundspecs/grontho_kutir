import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
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
                    TextFormField(
                      controller: _idController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixText: "u",
                        suffixText: "@student.cuet.ac.bd",
                      ),
                      validator: idValidator,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: passwordValidator,
                    ),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text('Sign In'),
                    ),
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
