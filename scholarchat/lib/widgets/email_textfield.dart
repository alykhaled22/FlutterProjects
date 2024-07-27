import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class EmailTextfield extends StatelessWidget {
  EmailTextfield({super.key, this.onChanged});

  final Function(String)? onChanged;
  final validator1 = ValidationBuilder().email().build();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        } 
        return validator1(value);        
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        prefixIconColor: Colors.white,
        labelText: "Email",
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
