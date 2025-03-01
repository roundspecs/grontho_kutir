import 'package:flutter/material.dart';

import '../../../core/themes/dimens.dart';

class EmailVerificationScreen extends StatelessWidget {
  final String email;
  const EmailVerificationScreen(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Title(
        color: Theme.of(context).colorScheme.primary,
        title: 'Email verification - গ্রন্থকুটির',
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: Dimens.paddingHorizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  'Email sent to $email',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Please check your inbox and click on the email verification link to verify your email.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
