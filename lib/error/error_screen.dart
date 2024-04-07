import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
