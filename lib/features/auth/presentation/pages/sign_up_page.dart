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
  final _hallNameController = TextEditingController();
  final _roomNumberController = TextEditingController();

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
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Hall',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Qudrat-e-Khuda Hall',
                          child: Text('Qudrat-e-Khuda Hall'),
                        ),
                        DropdownMenuItem(
                          value: 'Tareq Huda Hall',
                          child: Text('Tareq Huda Hall'),
                        ),
                        DropdownMenuItem(
                          value: 'Shah Hall',
                          child: Text('Shah Hall'),
                        ),
                        DropdownMenuItem(
                          value: 'Abu Sayed Hall',
                          child: Text('Abu Sayed Hall'),
                        ),
                        DropdownMenuItem(
                          value: 'Titumir Hall',
                          child: Text('Titumir Hall'),
                        ),
                      ],
                      onChanged: (value) {
                        _hallNameController.text = value!;
                      },
                      validator: hallNameValidator,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _roomNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Room No',
                      ),
                      validator: roomNumberValidator,
                      keyboardType: TextInputType.number,
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
                        if (_passwordController.text ==
                                _confirmPasswordController.text &&
                            _formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUpWithEmailAndPassword(
                                  name: _nameController.text,
                                  hallName: _hallNameController.text,
                                  roomNumber: _roomNumberController.text,
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
