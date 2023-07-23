import 'dart:typed_data';

import 'package:chat_app/features/enter_your_information/data/repos/enter_your_information_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_data_model.dart';

class EnterYourInformationRepoImplementation extends EnterYourInformationRepo {
  @override
  Future uploadUserData(
      {required String phone,
      required String name,
      required String id,
      required String email,
      required String image}) async {
    try {
      UserDataModel userData = UserDataModel(
        image: image,
        name: name,
        email: email,
        id: id,
        phone: phone,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(phone)
          .set(userData.toMap());
    } catch (error) {}
  }

  @override
  Future pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        Uint8List memoryImage = await imageFile.readAsBytes();
        return memoryImage;
      } else {
        print('No item Selected');
      }
    } catch (error) {}
  }
}
