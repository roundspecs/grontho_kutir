import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignUpPage extends StatefulWidget {
  static const path = '/sign-up';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _hallNameController = TextEditingController();
  final _roomNumberController = TextEditingController();
  bool stayInHall = true;

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Theme.of(context).colorScheme.primary,
      title: 'Sign Up - গ্রন্থকুটির',
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
                    'Create an account to get started',
                    style: TextStyle(fontSize: 24),
                  ),
                  LimitWidth(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _nameTextField(),
                          _emailTextField(),
                          _phoneNumberTextField(),
                          _stayInHallDropdown(),
                          if (stayInHall) ...[
                            Row(
                              spacing: 8,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _hallDropdown(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: _roomNumberTextField(),
                                ),
                              ],
                            ),
                          ],
                          _passwordTextField(),
                          _confirmPasswordTextField(),
                          _signUpButton(context),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      InkWell(
                        onTap: () => context.go(SignInPage.path),
                        child: const Text(
                          'Sign In',
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

  FilledButton _signUpButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<AuthBloc>().add(
                AuthSignUpWithEmailAndPasswordEvent(
                  name: _nameController.text,
                  hallName: _hallNameController.text,
                  roomNumber: _roomNumberController.text,
                  email: idToEmail(_idController.text),
                  phoneNumber: '+880${_phoneNumberController.text}',
                  password: _passwordController.text,
                ),
              );
        }
      },
      child: Text('Sign Up'),
    );
  }

  TextFormField _confirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Confirm Password'),
      validator: (value) => confirmPasswordValidator(
        _passwordController.text,
        value,
      ),
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

  TextFormField _roomNumberTextField() {
    return TextFormField(
      controller: _roomNumberController,
      decoration: const InputDecoration(labelText: 'Room No'),
      validator: stayInHall ? roomNumberValidator : null,
      keyboardType: TextInputType.number,
    );
  }

  DropdownButtonFormField<String> _hallDropdown() {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Hall'),
      items: const [
        DropdownMenuItem(
            value: 'Qudrat-e-Khuda Hall', child: Text('Qudrat-e-Khuda Hall')),
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
      onChanged: (value) => _hallNameController.text = value!,
      validator: stayInHall ? hallNameValidator : null,
    );
  }

  DropdownButtonFormField<bool> _stayInHallDropdown() {
    return DropdownButtonFormField<bool>(
      value: stayInHall,
      decoration: const InputDecoration(labelText: 'Stay in Hall'),
      items: const [
        DropdownMenuItem(value: true, child: Text('Yes')),
        DropdownMenuItem(value: false, child: Text('No')),
      ],
      onChanged: (value) => setState(() => stayInHall = value!),
    );
  }

  TextFormField _phoneNumberTextField() {
    return TextFormField(
      controller: _phoneNumberController,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        prefixText: '+880',
      ),
      validator: phoneNumberValidator,
      keyboardType: TextInputType.number,
    );
  }

  TextFormField _emailTextField() {
    return TextFormField(
      controller: _idController,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixText: 'u',
        suffixText: '@student.cuet.ac.bd',
      ),
      validator: idValidator,
      keyboardType: TextInputType.number,
    );
  }

  TextFormField _nameTextField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: nameValidator,
    );
  }
}
