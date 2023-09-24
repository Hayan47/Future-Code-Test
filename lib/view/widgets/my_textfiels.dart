// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction actionType;
  final FormFieldValidator? validator;
  final Widget prefix;
  final Widget? suffix;
  final bool? obsecure;

  const MyTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.actionType,
    required this.validator,
    required this.prefix,
    this.suffix,
    this.obsecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.orange,
                width: 0.4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validator,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                ),
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.only(top: 8, left: 10, right: 10),
                  //!hint style
                  hintStyle: GoogleFonts.cairo(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                  ),
                  //!prefix icon
                  prefixIcon: prefix,
                  //!suffix icon
                  suffixIcon: suffix,
                  //!hint
                  hintText: hint,
                ),
                // textAlignVertical: TextAlignVertical.bottom,
                // cursorHeight: 18,
                // cursorColor: Colors.orange,
                showCursor: false,
                keyboardType: inputType,
                textInputAction: actionType,
                obscureText: obsecure ?? false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
