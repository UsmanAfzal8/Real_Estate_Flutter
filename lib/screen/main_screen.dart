import 'package:flutter/material.dart';
import 'package:real_estate/utilities/app_images.dart';

import '../widgets/custom/custom_icon_button.dart';
import '../widgets/custom/custom_radio_button.dart';
import '../widgets/custom/for_text_custom_widget.dart';
import '../widgets/property/latest_property.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        ForText(
                          name: 'Asan Hal Property',
                          color: Colors.white,
                          bold: true,
                          size: 22,
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(255, 44, 76, 89),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Search for best result',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        CustomRadioButton(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomIconButton(
                        title: 'House', imageurl: AppImages.houseIcon),
                    CustomIconButton(
                      title: 'Office',
                      imageurl: AppImages.officeIcon,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomIconButton(
                      title: 'Shop',
                      imageurl: AppImages.shopIcon,
                    ),
                    CustomIconButton(
                      title: 'Plot',
                      imageurl: AppImages.plotIcon,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const ForText(
                      name: 'Latest Products',
                      bold: true,
                      size: 18,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: ForText(
                        name: 'View All',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const LatestPropertyList(),
            ],
          ),
        ),
      ),
    );
  }
}
