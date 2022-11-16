// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../enum/purpose_enum.dart';
import '../enum/status_enum.dart';
import '../enum/type_enum.dart';

class Property {
  final String pID;
  final String imageurl;
  final String description;
  final String location;
  final int bedRoom;
  final int bathRoom;
  final int parking;
  final int garden;
  final double price;
  final double marla;
  final bool gas;
  final bool electricity;
  StatusEnum status;
  TypeEnum type;
  PurposeEnum purpose;
  Property({
    required this.pID,
    required this.imageurl,
    required this.description,
    required this.location,
    required this.bedRoom,
    required this.bathRoom,
    required this.parking,
    required this.garden,
    required this.price,
    required this.marla,
    required this.gas,
    required this.electricity,
    this.status = StatusEnum.pending,
    this.type = TypeEnum.house,
    this.purpose = PurposeEnum.sell,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pid':pID,
      'image_url': imageurl,
      'description': description,
      'location': location,
      'bed_room': bedRoom,
      'bath_room': bathRoom,
      'parking': parking,
      'garden': garden,
      'price': price,
      'marla': marla,
      'gas': gas,
      'electricity': electricity,
      'status': status.value,
      'type': type.value,
      'purpose': purpose.value,
    };
  }

  factory Property.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Property(
      pID: doc.data()?['pid']??'',
      imageurl: doc.data()?['image_url'] ?? '',
      description: doc.data()?['description'] ?? '',
      location: doc.data()?['location'] ?? '',
      bedRoom: doc.data()?['bed_room'] ?? 0,
      bathRoom: doc.data()?['bath_room'] ?? 0,
      parking: doc.data()?['parking'] ?? 0,
      garden: doc.data()?['garden'] ?? 0,
      price: doc.data()?['price'] ?? 0,
      marla: doc.data()?['marla'] ?? 0,
      gas: doc.data()?['gas'] ?? true,
      electricity: doc.data()?['electricity'] ?? true,
      status: StatusConvetion().stringToEnum(doc.data()?['status']),
      type: TypeStatusConvetion().stringToEnum(doc.data()?['type']),
      purpose: PurposeStatusConvetion().stringToEnum(doc.data()?['purpose']),
    );
  }
}
