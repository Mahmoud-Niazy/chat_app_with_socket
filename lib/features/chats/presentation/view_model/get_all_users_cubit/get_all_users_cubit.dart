import 'package:chat_app/features/chats/data/repos/chats_repos_imp.dart';
import 'package:chat_app/features/enter_your_information/data/models/user_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_users_states.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersStates> {
  GetAllUsersCubit() : super(GetAllUsersInitialStates());

  static GetAllUsersCubit get(context) => BlocProvider.of(context);

  List<UserDataModel> users = [];

  getAllUsers() {
    emit(GetAllUsersLoadingStates());
    ChatsRepoImplementation().getAllUsers().then((value) {
      users = value;
      emit(GetAllUsersSuccessfullyStates());
    }).catchError((error) {
      print(error);
      emit(GetAllUsersErrorStates());
    });
  }
}
