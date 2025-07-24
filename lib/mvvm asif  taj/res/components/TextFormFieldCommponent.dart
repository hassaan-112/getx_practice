import 'package:flutter/material.dart';

import '../colors/app colors.dart';
class TextFormFieldComponent extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FormFieldValidator validator;
  final FormFieldSetter onSubmited;
  final bool enabled, autoFocus;
  final Function onTapedOutside;

  const TextFormFieldComponent({super.key,
    required this.hintText,
    this.obscureText=false,
    required this.controller,
    required this.keyboardType,
    required this.focusNode,
    required this.validator,
    required this.onSubmited,
    this.enabled=true,
    this.autoFocus=false,
    required this.onTapedOutside
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmited,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      onTapOutside: (event){
        widget.onTapedOutside(event);
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(),
        focusedBorder: border(AppColors.blue),
        enabledBorder: border(AppColors.blue),
        errorBorder: border(AppColors.red),
        focusedErrorBorder: border(AppColors.red),
      ),
    );
  }
}
OutlineInputBorder border(Color color)=> OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: color),

);