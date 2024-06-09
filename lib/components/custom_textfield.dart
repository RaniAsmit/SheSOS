import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final Function(String?)? onsave;
  final int? maxLines;
  final bool isPassword;
  final bool enable;
  final bool? check;
  final TextInputType? Keyboardtype;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;

  CustomTextfield(
      {this.controller,
      this.check,
      this.enable = true,
      this.Keyboardtype,
      this.focusNode,
      this.hintText,
      this.isPassword = false,
      this.maxLines,
      this.onsave,
      this.prefix,
      this.suffix,
      this.textInputAction,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable == true ? true : enable,
      maxLines: maxLines == null ? 1 : maxLines,
      onSaved: onsave,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: Keyboardtype == null ? TextInputType.name : Keyboardtype,
      controller: controller,
      validator: validate,
      obscureText: isPassword == false ? false : isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: hintText ?? "hintText....",
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 255, 254, 254),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              style: BorderStyle.solid,
              color: const Color.fromARGB(255, 8, 8, 8)),
        ),
      ),
    );
  }
}
