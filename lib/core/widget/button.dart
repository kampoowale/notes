import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onTap;
  const Button({super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
        onPressed: () {
          onTap();
        },
        child: Text(
          'Save Note',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
