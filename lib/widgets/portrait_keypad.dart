import 'package:flutter/material.dart';
import 'keypad_button.dart';

class PortraitKeypad extends StatelessWidget {
  final Function(String) onDigitPressed;
  final VoidCallback onClearPressed;

  const PortraitKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            KeypadButton(label: '1', onPressed: () => onDigitPressed('1')),
            KeypadButton(label: '2', onPressed: () => onDigitPressed('2')),
            KeypadButton(label: '3', onPressed: () => onDigitPressed('3')),
          ],
        ),
        Row(
          children: [
            KeypadButton(label: '4', onPressed: () => onDigitPressed('4')),
            KeypadButton(label: '5', onPressed: () => onDigitPressed('5')),
            KeypadButton(label: '6', onPressed: () => onDigitPressed('6')),
          ],
        ),
        Row(
          children: [
            KeypadButton(label: '7', onPressed: () => onDigitPressed('7')),
            KeypadButton(label: '8', onPressed: () => onDigitPressed('8')),
            KeypadButton(label: '9', onPressed: () => onDigitPressed('9')),
          ],
        ),
        Row(
          children: [
            KeypadButton(label: '0', onPressed: () => onDigitPressed('0')),
            KeypadButton(label: 'CLEAR', onPressed: onClearPressed, flex: 2),
          ],
        ),
      ],
    );
  }
}
