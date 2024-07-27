import 'package:flutter/material.dart';
import 'package:scholarchat/constant.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key, required this.onChange, required this.controller,required this.onPressed});

  final Function(String)? onChange;
  final VoidCallback? onPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: onPressed,
          ),
          suffixIconColor: kPrimaryColor,
          hintText: " Type a message...",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              ))),
    );
  }
}
