import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForText extends StatelessWidget {
  const ForText({
    required this.name,
    this.size,
    this.bold,
    this.color,
    Key? key,
  }) : super(key: key);
  final String name;
  final double? size;
  final bool? bold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.heebo(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: bold == true ? FontWeight.w500 : FontWeight.w400,
      ),
    );
  }
}
