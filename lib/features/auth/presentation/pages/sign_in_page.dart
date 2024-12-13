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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const Text(
              'Welcome back!',
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
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixText: "u",
                        suffixText: "@student.cuet.ac.bd",
                      ),
                      validator: idValidator,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                    }, child: Text('Sign In')),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                SizedBox(width: 8),
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
