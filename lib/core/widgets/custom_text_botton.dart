import 'package:flutter/material.dart';

class CustomTextBotton extends StatelessWidget {
  const CustomTextBotton({
    super.key,
    required this.text,
    required this.onPress,
    required this.alignment,
  });

  final String text;
  final VoidCallback onPress;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: Theme.of(
        context,
      ).textButtonTheme.style?.copyWith(alignment: alignment),
      onPressed: onPress,
      child: Text(text),
    );
  }
}
