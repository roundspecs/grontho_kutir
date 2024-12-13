import 'package:flutter/material.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grontho Kutir',
      theme: theme,
      initialRoute: '/sign-up',
      routes: {
        SignUpPage.route: (context) => const SignUpPage(),
        SignInPage.route: (context) => const SignInPage(),
      },
    );
  }
}
