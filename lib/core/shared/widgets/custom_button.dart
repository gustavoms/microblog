import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  late final bool outlined;
  final String text;
  final void Function() onPressed;
  final Color? color;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key) {
    outlined = false;
  }

  CustomButton.outlined({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
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
            style: ButtonStyle(
                backgroundColor:
                    color != null ? MaterialStateProperty.all(color) : null),
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
