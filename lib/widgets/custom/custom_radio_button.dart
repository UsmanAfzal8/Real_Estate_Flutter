import 'package:flutter/material.dart';
import 'package:real_estate/widgets/custom/for_text_custom_widget.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool rent = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rent = !rent;
          print(rent);
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: const Color.fromARGB(255, 44, 76, 89),
          ),
          child: rent
              ? Row(
                  children: [selectedText('Rent'), unSelectedText('Buy')],
                )
              : Row(
                  children: [unSelectedText('Rent'), selectedText('Buy')],
                )),
    );
  }

  Padding unSelectedText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ForText(
        name: text,
        color: Colors.white,
        size: 16,
        bold: true,
      ),
    );
  }

  Widget selectedText(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ForText(
          name: text,
          color: Colors.black,
          size: 16,
          bold: true,
        ),
      ),
    );
  }
}
