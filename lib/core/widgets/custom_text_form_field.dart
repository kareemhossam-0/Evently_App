import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.isSecure = false,
    this.suffixIcon,
    this.onClick,
    this.keyboardType = TextInputType.text,
    this.maxLines,
  });

  final String labelText;
  final IconData? prefixIcon;
  final bool isSecure;
  final IconData? suffixIcon;
  final VoidCallback? onClick;
  final TextInputType keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
            suffixIcon != null
                ? IconButton(onPressed: onClick, icon: Icon(suffixIcon))
                : null,
      ),
    );
  }
}
