import 'package:chat_app/features/login/data/repo/login_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginRepoImplementation extends LoginRepo {
  @override
  Future checkIfUserExistOrNot({required String phone}) async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('users').doc(phone).get();
      bool isExist = response.exists;
      return isExist;
    } catch (error) {}
  }


}
