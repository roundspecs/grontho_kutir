import 'package:flutter/material.dart';

class LimitWidth extends StatelessWidget {
  final Widget child;
  const LimitWidth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: child,
    );
  }
}
