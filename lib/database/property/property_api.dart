import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate/model/property.dart';

import '../../widgets/custom/custom_toast.dart';

class PropertyApi {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static const String _collection = 'property';
  Future<bool> add(Property property) async {
    try {
      await _instance
          .collection(_collection)
          .doc(property.pID)
          .set(property.toMap());
      // CustomToast.successToast(message: 'Successfully Added');
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }

  Future<List<Property>> get() async {
    List<Property> propeties = <Property>[];
    QuerySnapshot<Map<String, dynamic>> snapshot = await _instance.collection(_collection).get();
    for (DocumentSnapshot<Map<String, dynamic>> e in snapshot.docs) {
      propeties.add(Property.fromMap(e));
    }
    return propeties;
  }
}
