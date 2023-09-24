// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropdown extends StatefulWidget {
  final double? width;
  final String label;
  final Object dropdownValue;
  final List<DropdownMenuItem<Object>> items;
  final ValueChanged onChanged;
  final String icon;
  const MyDropdown({
    Key? key,
    this.width,
    required this.label,
    required this.dropdownValue,
    required this.items,
    required this.onChanged,
    required this.icon,
  }) : super(key: key);

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState<T> extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                widget.icon,
                color: Colors.orange,
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // const SizedBox(width: 25),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              style: GoogleFonts.cairo(
                color: Colors.black,
                fontSize: 14,
              ),
              value: widget.dropdownValue,
              items: widget.items,
              onChanged: widget.onChanged,

              //button style
              buttonStyleData: ButtonStyleData(
                height: 40,
                width: MediaQuery.sizeOf(context).width * 0.4,
                // elevation: 2,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.orange,
                  ),
                ),
              ),

              //icon style
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.red,
                  size: 15,
                ),
              ),

              //dropdown style
              dropdownStyleData: DropdownStyleData(
                maxHeight: 300,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                offset: const Offset(5, -3),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
