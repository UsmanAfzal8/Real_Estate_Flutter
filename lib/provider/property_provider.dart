import 'package:flutter/cupertino.dart';
import 'package:real_estate/database/property/property_api.dart';
import 'package:real_estate/model/property.dart';

class PropertyProvider with ChangeNotifier {
  PropertyProvider() {
    load();
  }
  List<Property> _property = [];
  List<Property> get property => _property;
  load() async {
    _property = await PropertyApi().get();
    notifyListeners();
  }
}
