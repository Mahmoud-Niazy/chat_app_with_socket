import 'dart:math';
import 'dart:typed_data';

import 'package:chat_app/features/enter_your_information/data/repos/enter_your_information_repo_imp.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'enter_your_info_states.dart';

class EnterYourInformationCubit extends Cubit<EnterYourInformationStates> {
  EnterYourInformationCubit() : super(EnterYourInformationInitialState());

  static EnterYourInformationCubit get(context) => BlocProvider.of<EnterYourInformationCubit>(context);

  Uint8List? image ;
  String? imageUrl ;
  pickImage() {
    emit(ImagePickerLoadingState());
    EnterYourInformationRepoImplementation()
        .pickImage()
        .then((value) {
          image = value;
          emit(ImagePickerSuccessfullyState());
          FirebaseStorage.instance
              .ref()
              .child('images/${Random().nextInt(500000)}')
              .putData(image!)
              .then((value)async {
            imageUrl = await value.ref.getDownloadURL();
          });

    })
        .catchError((error) {
          emit(ImagePickerErrorState());
    });
  }

  uploadUserData({
    required String phone,
    required String name,
    required String id,
    required String email,
    required String image,
  }) {
    emit(UploadUserDataLoadingState());
    EnterYourInformationRepoImplementation()
        .uploadUserData(
      phone: phone,
      name: name,
      id: id,
      email: email,
      image: image,
    )
        .then((value) {
          emit(UploadUserDataSuccessfullyState());
    })
        .catchError((error) {
          emit(UploadUserDataErrorState());
    });
  }
}
