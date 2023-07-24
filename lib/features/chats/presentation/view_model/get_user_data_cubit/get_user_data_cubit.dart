import 'package:chat_app/core/cache_helper/cache_helper.dart';
import 'package:chat_app/features/chats/data/repos/chats_repos_imp.dart';
import 'package:chat_app/features/chats/presentation/view_model/get_user_data_cubit/get_user_data_states.dart';
import 'package:chat_app/features/enter_your_information/data/models/user_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserDataCubit extends Cubit<GetUserDataStates> {
  GetUserDataCubit() : super(GetUserDataInitialState());

  static GetUserDataCubit get(context) => BlocProvider.of<GetUserDataCubit>(context);

  UserDataModel? userData ;
  getUserData() {
    if(userData == null){
      emit(GetUserDataLoadingState());
      ChatsRepoImplementation()
          .getUserData(phone: CacheHelper.getData(key: 'phone'))
          .then((value) {
        userData = value;
        emit(GetUserDataSuccessfullyState());
      })
          .catchError((error) {
        emit(GetUserDataErrorState());
      });
    }
    else{}
  }
}
