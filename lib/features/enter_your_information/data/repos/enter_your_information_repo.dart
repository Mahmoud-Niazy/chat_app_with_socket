import 'package:image_picker/image_picker.dart';

abstract class EnterYourInformationRepo {
  Future uploadUserData({
    required String phone,
    required String name,
    required String id,
    required String email,
    required String image,
  });

  Future pickImage();
}