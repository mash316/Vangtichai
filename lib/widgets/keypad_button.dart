import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final int flex;

  const KeypadButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4.0),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(4.0),
            child: Container(
              height: 60, // Fixed height or can be flexible
              alignment: Alignment.center,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
