import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String message;

  const Loader(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
