// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../enum/purpose_enum.dart';
import '../enum/status_enum.dart';
import '../enum/type_enum.dart';

class Property {
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
  final StatusEnum status;
  final TypeEnum type;
  final PurposeEnum purpose;
  Property({
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
    required this.status,
    required this.type,
    required this.purpose,
  });
}
