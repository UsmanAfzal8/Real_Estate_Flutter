import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/provider/property_provider.dart';
import 'package:real_estate/widgets/property/property_tile.dart';

class LatestPropertyList extends StatelessWidget {
  const LatestPropertyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PropertyProvider propertyPro = Provider.of<PropertyProvider>(context);
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        itemCount: propertyPro.property.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return PropertyTile(
            property: propertyPro.property[index],
          );
        },
      ),
    );
  }
}
