import 'package:flutter/material.dart';

class CustomLaondingIndicator extends StatelessWidget {
  const CustomLaondingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
            child: CircularProgressIndicator(),
          );
  }
}