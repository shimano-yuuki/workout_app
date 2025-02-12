import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/view_model/Login_notifier.dart';

class CustomTextFormWidget extends ConsumerWidget {
  const CustomTextFormWidget({
    super.key,
    this.keyboardType,
    this.icon,
    required this.labelText,
    this.obscure = false,
    this.onChanged,
    this.controller,
    this.validateText,
  });

  final TextInputType? keyboardType;
  final String labelText;
  final Icon? icon;
  final bool obscure;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validateText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget? suffixIcon;
    if (obscure == true) {
      suffixIcon = IconButton(
          icon: Icon(ref.watch(isObscureProvider)
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () {
            ref.read(isObscureProvider.notifier).changeIsObscure();
          });
    } else {
      suffixIcon = null;
    }

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscure == false ? false : ref.watch(isObscureProvider),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: icon,
          suffixIcon: suffixIcon),
      validator: validateText,
    );
  }
}
