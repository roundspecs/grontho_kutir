import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/models/hall/hall.dart';
import '../../../../routing/routes.dart';
import '../../../../utils/show_snackbar.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/loader.dart';
import '../view_model/register_view_model.dart';
import 'email_verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  final RegisterViewModel viewModel;

  const RegisterScreen({super.key, required this.viewModel});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _hallNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _roomNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _stayInHall = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _hallNameController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _roomNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Title(
        color: Theme.of(context).colorScheme.primary,
        title: 'Register - গ্রন্থকুটির',
        child: Center(
          child: BlocConsumer<RegisterViewModel, RegisterState>(
            bloc: widget.viewModel,
            listenWhen: (previous, current) {
              return current is RegisterFailure || current is RegisterSuccess;
            },
            listener: (context, state) {
              if (state is RegisterFailure) {
                context.showSnackBar(message: state.message, isError: true);
              } else if (state is RegisterSuccess) {
                context.showSnackBar(message: state.message, isError: false);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EmailVerificationScreen(state.email),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is RegisterLoading) {
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
                          'Get started with গ্রন্থকুটির',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            } else if (value.length < 3) {
                              return 'Name must be at least 3 characters long';
                            }
                            return null;
                          },
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
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            prefixText: '+880',
                          ),
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (value.length != 10) {
                              return 'Phone number is not valid';
                            }
                            return null;
                          },
                        ),
                        DropdownButtonFormField<bool>(
                          value: _stayInHall,
                          decoration: InputDecoration(
                            labelText: 'Stay in hall',
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: true,
                              child: Text('Yes'),
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Text('No'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _stayInHall = value!;
                              if (_stayInHall) {
                                _addressController.clear();
                              } else {
                                _hallNameController.clear();
                                _roomNumberController.clear();
                              }
                            });
                          },
                        ),
                        if (_stayInHall)
                          Column(
                            spacing: Dimens.paddingHorizontal,
                            children: [
                              DropdownButtonFormField<String>(
                                value: _hallNameController.text.isEmpty
                                    ? null
                                    : _hallNameController.text,
                                decoration: InputDecoration(labelText: 'Hall'),
                                items: Hall.values
                                    .map(
                                      (hall) => DropdownMenuItem(
                                        value: hall.name,
                                        child: Text(hall.name),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _hallNameController.text = value!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your hall';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _roomNumberController,
                                decoration: InputDecoration(
                                  labelText: 'Room Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your room number';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )
                        else
                          TextFormField(
                            controller: _addressController,
                            decoration:
                                InputDecoration(labelText: 'Current Address'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your current address';
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
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.viewModel.register(
                                name: _nameController.text,
                                hallName: _hallNameController.text,
                                roomNumber: _roomNumberController.text,
                                email:
                                    'u${_emailController.text}@student.cuet.ac.bd',
                                phoneNumber: '+880${_phoneController.text}',
                                currentAddress: _addressController.text,
                                password: _passwordController.text,
                              );
                            }
                          },
                          child: const Text('Register'),
                        ),
                        TextButton(
                          onPressed: () => context.go(Routes.logIn),
                          child: const Text('Already have an account? Log in'),
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
