import 'package:flutter/material.dart';

class Ctextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final bool? obscureText;
  final TextInputType? keyboardType;
  const Ctextfield(
      {Key? key,
      this.controller,
      this.hint,
      this.prefix,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(prefix: prefix, hintText: hint ?? ''),
      keyboardType: keyboardType,
    );
  }
}
