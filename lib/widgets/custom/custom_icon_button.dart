// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'for_text_custom_widget.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final String imageurl;
  const CustomIconButton({
    Key? key,
    required this.title,
    required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xfff8fafb),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 30,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image(
              image: AssetImage(imageurl),
              fit: BoxFit.fill,
              color: Colors.grey,
            ),
          ),
          ForText(
            name: title,
            color: Colors.grey,
            size: 16,
            bold: true,
          )
        ],
      ),
    );
  }
}
