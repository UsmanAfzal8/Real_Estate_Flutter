import 'package:flutter/material.dart';
import 'package:real_estate/widgets/custom/for_text_custom_widget.dart';

import '../widgets/custom/custom_icon_button.dart';

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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    CustomIconButton(title: 'House', icon: Icons.house),
                    CustomIconButton(title: 'Office', icon: Icons.house),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    CustomIconButton(title: 'Shop', icon: Icons.house),
                    CustomIconButton(title: 'Plot', icon: Icons.house),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
