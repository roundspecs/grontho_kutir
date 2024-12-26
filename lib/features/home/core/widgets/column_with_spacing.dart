import 'package:flutter/material.dart';

class ColumnWithSpacing extends StatelessWidget {
  final List<Widget> children;
  const ColumnWithSpacing({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: children,
      ),
    );
  }
}
