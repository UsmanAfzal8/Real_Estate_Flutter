import 'package:flutter/material.dart';

import '../utilities/app_images.dart';

class MianScreen extends StatelessWidget {
  const MianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
               SizedBox(
                  height: 450,
                  width: double.infinity,
                 child: Image(image: AssetImage(AppImages.homeBackground)),
                ),
                Positioned(
                  bottom: -height * 0.5,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      height: height * 0.6,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(68)),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0, 40);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
