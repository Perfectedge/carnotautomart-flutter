import 'package:flutter/material.dart';

class TextBoxWidget extends StatefulWidget {
  TextBoxWidget(
      {super.key,
      required this.textTheme,
      required this.controller,
      required this.lableText,
      this.suffixIcon,
      this.validator,
      this.isObsecure,
      this.focusNode,
      this.suffixIconConstraints
      });

  final TextTheme textTheme;
  final String lableText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  String? Function(String?)? validator;
  bool? isObsecure;
  FocusNode? focusNode;
  BoxConstraints? suffixIconConstraints;

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: Colors.white,
        scrollPadding: EdgeInsets.zero,
        obscureText: widget.isObsecure ?? false,
        style: widget.textTheme.bodyMedium
            ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: widget.lableText.toUpperCase(),
            labelStyle: widget.textTheme.bodyMedium?.copyWith(
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            //  helperText: ' ',
            // hintText: _isFocused ? '' : widget.lableText.toUpperCase(),
            //  hintStyle:widget.textTheme.bodySmall?.copyWith(color: Colors.white),

            enabledBorder: _border,
            focusedBorder: _border,
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints:widget.suffixIconConstraints??
                const BoxConstraints(maxHeight: 15, maxWidth: 20)),
        validator: widget.validator,
      ),
    );
  }

  final _border =
      const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
}
