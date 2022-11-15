import 'package:flutter/material.dart';
import 'package:real_estate/widgets/custom/custom_elevated_button.dart';
import 'package:real_estate/widgets/custom/for_text_custom_widget.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 450,
                    width: double.infinity,
                    child: Image(
                        image: AssetImage(AppImages.homeBackground),
                        fit: BoxFit.fill),
                  ),
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
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
                            const ForText(
                              name: 'Perfect choice \nfor your future',
                              bold: true,
                              size: 42,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Our properties the masterpiece for \nevery client with lasting value.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            CustomElevatedButton(
                                title: 'Continue', onTap: () {}),
                          ],
                        ),
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
