import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {
  final String errorMessage;

  const LoadingError({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
