import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(8));

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      required this.icon,
      required this.isPassword,
      });

  final TextEditingController textEditingController;
  final IconData icon;
  final String hintText;
  final bool isPassword;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      style: GoogleFonts.urbanist(
        color: Colors.black,
        fontSize: 15,
      ),
      obscuringCharacter: '●',
      obscureText: widget.isPassword && !isPasswordVisible,
      onChanged: (value) {},
      decoration: InputDecoration(
          hintStyle: GoogleFonts.urbanist(
            color: Colors.black54,
            fontSize: 15,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          errorStyle: GoogleFonts.urbanist(
            color: Colors.red,
            fontSize: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: kBorderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: kBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: kBorderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: kBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: kBorderRadius,
          ),
          prefixIcon: Icon(widget.icon,color: Colors.black54,),
          suffixIcon: IconButton(
        splashRadius: 15,
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Visibility(
            visible: widget.isPassword,
            child: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: !isPasswordVisible
                  ? Colors.black
                  : Colors.red,
            ),
          )),
          hintText: widget.hintText,
        ),
    );
  }


}
