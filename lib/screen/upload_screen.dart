import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/database/property/property_api.dart';
import 'package:real_estate/widgets/custom/custom_toast.dart';

import '../../function/time_date_function.dart';

import '../../utilities/image_picker.dart';

import '../database/image_storage.dart';
import '../model/property.dart';
import '../widgets/custom/custom_elevated_button.dart';
import '../widgets/custom/custom_text_form_field.dart';
import '../widgets/custom/custom_validator.dart';
import '../widgets/custom/for_text_custom_widget.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController decription = TextEditingController();
  final TextEditingController amount = TextEditingController();

  Uint8List? _image;
  bool _isloading = false;
  int uuid = TimeStamp.timestamp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> uploaddata() async {
    String imageURL = '';
    if (_image != null) {
      //url = await UserApi().uploadProfilePhoto(file: _profilePhoto!);
      imageURL = await Storagemethod().uploadtostorage(
        'Property',
        'Testing',
        _image!,
      );
    }
    Property property = Property(
        pID: uuid.toString(),
        imageurl: imageURL,
        description: decription.text,
        location: 'Shahkot',
        bedRoom: 4,
        bathRoom: 4,
        parking: 2,
        garden: 1,
        price: double.parse(amount.text),
        marla: 20,
        gas: true,
        electricity: true);

    bool temp = await PropertyApi().add(property);
    if (temp) {
      CustomToast.successToast(message: 'Uploaded');
      decription.clear();
      amount.clear();
    }
  }

  selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: _image != null
                      ? GestureDetector(
                          onTap: () {
                            selectImage();
                          },
                          child: Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(_image!),
                                    fit: BoxFit.contain)),
                          ),
                        )
                      : Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  onPressed: selectImage,
                                  icon: const Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: Colors.white,
                                      size: 36),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const ForText(
                                  name: 'Add Image',
                                  color: Colors.white,
                                  size: 22,
                                )
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: decription,
                  hint: 'Enter Description',
                  maxLines: 5,
                  readOnly: _isloading,
                  validator: (String? value) =>
                      CustomValidator.lessThen2(value),
                ),
                CustomTextFormField(
                  controller: amount,
                  hint: 'Enter  Price',
                  readOnly: _isloading,
                  validator: (String? value) => CustomValidator.isEmpty(value),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
                const SizedBox(height: 20),
                _isloading
                    ? const CircularProgressIndicator()
                    : CustomElevatedButton(
                        title: 'Upload',
                        onTap: () {
                          uploaddata();
                        },
                      ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(
      BuildContext context, TextEditingController controller, String hint) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller,
          hint: hint,
          validator: (String? value) => CustomValidator.isEmpty(value),
        ),
      ],
    );
  }
}
