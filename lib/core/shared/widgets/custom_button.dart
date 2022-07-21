import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  late final bool outlined;
  final String text;
  final void Function() onPressed;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key) {
    outlined = false;
  }

  CustomButton.outlined({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key) {
    outlined = true;
  }

  @override
  Widget build(BuildContext context) {
    return outlined
        ? OutlinedButton(
            onPressed: onPressed,
            child: Text(text),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
