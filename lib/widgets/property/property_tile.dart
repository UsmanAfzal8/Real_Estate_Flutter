import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/model/property.dart';

import '../../function/price_converstion_function.dart';
import '../custom/custom_network_image.dart';
import '../custom/for_text_custom_widget.dart';

class PropertyTile extends StatelessWidget {
  const PropertyTile({required this.property, Key? key}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: InkWell(
        onTap: () {},
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
                        child: Text(
                          PriceConverstion().price(property.price),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 6),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          const ForText(
                            name: '0 Review',
                            size: 11,
                            color: Colors.grey,
                          ),
                        ],
                      ),
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
