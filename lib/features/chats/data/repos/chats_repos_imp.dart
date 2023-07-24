import 'package:chat_app/core/cache_helper/cache_helper.dart';
import 'package:chat_app/features/chats/data/repos/chats_repos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../enter_your_information/data/models/user_data_model.dart';

class ChatsRepoImplementation extends ChatsRepo{

  @override
  Future getAllUsers() async{
    try{
      List<UserDataModel> users = [];
      QuerySnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('users').get();
      response.docs.forEach((element) {
        if(element.data()['phone'] != CacheHelper.getData(key: 'phone')) {
          users.add(UserDataModel.fromJson(element.data()));
        }
      });
      return users;
    }
    catch(error){}

  }

  @override
  Future getUserData({
    required String phone,
}) async{
    try{
      DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('users')
          .doc(phone).get();
      return UserDataModel.fromJson(response.data()!);
    }
    catch(error){}
  }

}