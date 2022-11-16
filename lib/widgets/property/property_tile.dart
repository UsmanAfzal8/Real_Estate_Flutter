import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/model/property.dart';
import 'package:real_estate/utilities/app_images.dart';

import '../../function/price_converstion_function.dart';
import '../custom/custom_network_image.dart';
import '../custom/for_text_custom_widget.dart';
import 'property_full_screen.dart';

class PropertyTile extends StatelessWidget {
  const PropertyTile({required this.property, Key? key}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: InkWell(
        onTap: () {
           Navigator.push(
                      context,
                      // ignore: always_specify_types
                      MaterialPageRoute(
                        builder: (BuildContext context) =>  ProductFullScreen(property: property),
                      ),
                    );
        },
        child: AspectRatio(
          aspectRatio: 9 / 12,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomNetworkImage(
                          imageURL: property.imageurl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 72,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ForText(name: 'Pkr'),
                            Text(
                              PriceConverstion().price(property.price),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 6),
                          SizedBox(
                            height: 14,
                            width: 14,
                            child: Image(
                              image: AssetImage(AppImages.locationIcon),
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 6),
                          ForText(
                            name: property.location,
                            size: 11,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(width: 6),
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image(
                                image: AssetImage(AppImages.bedRoomIcon),
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 6),
                            ForText(
                              name: property.bedRoom.toString(),
                              size: 11,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image(
                                image: AssetImage(AppImages.bathRoomIcon),
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 6),
                            ForText(
                              name: property.bathRoom.toString(),
                              size: 11,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 6),
                            property.electricity
                                ? SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Image(
                                      image:
                                          AssetImage(AppImages.electricityIcon),
                                      color: Colors.grey,
                                    ),
                                  )
                                : SizedBox(),
                            const SizedBox(width: 6),
                            property.gas
                                ? SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Image(
                                      image: AssetImage(AppImages.gasIcon),
                                      color: Colors.grey,
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
