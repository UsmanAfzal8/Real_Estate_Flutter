import 'package:flutter/material.dart';
import 'package:real_estate/widgets/custom/custom_elevated_button.dart';
import 'package:real_estate/widgets/custom/for_text_custom_widget.dart';

import '../../function/price_converstion_function.dart';
import '../../model/property.dart';
import '../../utilities/app_images.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_network_image.dart';

class ProductFullScreen extends StatelessWidget {
  final Property property;
  const ProductFullScreen({super.key,required this.property});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: CustomNetworkImage(
                          imageURL: property.imageurl,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Positioned(
                bottom: -height * 0.5,
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: height * 0.6,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32),
                              topLeft: Radius.circular(32)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                 const ForText(
                                    name: 'Pkr',
                                    size: 18,
                                  ),
                                 const SizedBox(
                                    width: 20
                                  ),
                                  Text(
                                     PriceConverstion().price(property.price),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CustomIconButton(
                                        title: '${property.bedRoom} Bedroom',
                                        imageurl: AppImages.bedRoomIcon),
                                    CustomIconButton(
                                      title: '${property.bathRoom} Bathroom',
                                      imageurl: AppImages.bathRoomIcon,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CustomIconButton(
                                      title: '${property.garden} Garden',
                                      imageurl: AppImages.gardenIcon,
                                    ),
                                    CustomIconButton(
                                      title: '${property.parking} Parking',
                                      imageurl: AppImages.parkingIcon,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CustomIconButton(
                                      title: 'Gas Avaliable',
                                      imageurl: AppImages.gasIcon,
                                    ),
                                    CustomIconButton(
                                      title: 'Electricity',
                                      imageurl: AppImages.electricityIcon,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                               Text(
                                property.description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style:const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 60,
                        right: 60,
                        left: 60,
                        child: SizedBox(
                          width: 250,
                          child:
                              CustomElevatedButton(title: 'Call', onTap: () {}),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
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
