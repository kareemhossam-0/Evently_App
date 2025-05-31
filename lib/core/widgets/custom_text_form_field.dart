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
    this.maxLines = 1,
    this.labelStyle,
    this.controller,
    this.validator,

  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final IconData? prefixIcon;
  final bool isSecure;
  final IconData? suffixIcon;
  final VoidCallback? onClick;
  final TextInputType keyboardType;
  final int? maxLines;
  final TextStyle? labelStyle;





  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isSecure,
      decoration: InputDecoration(


        labelText: labelText,
        labelStyle: labelStyle,

        prefixIcon: Icon(prefixIcon, color: Theme
            .of(context)
            .iconTheme
            .color,),
        suffixIcon:
            suffixIcon != null
                ? IconButton(onPressed: onClick, icon: Icon(suffixIcon))
                : null,
      ),
    );
  }
}
