import 'package:chat_app/core/widgets/loading.dart';
import 'package:chat_app/features/chats/presentation/view/widgets/chat_item.dart';
import 'package:chat_app/features/chats/presentation/view_model/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/get_all_users_cubit/get_all_users_states.dart';
import 'package:chat_app/features/login/presentation/view/widgets/background_container_with_primary_color.dart';
import 'package:chat_app/features/login/presentation/view/widgets/white_container_with_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundContainerWithPrimaryColor(text: 'chats'),
        WhiteContainerWithWidget(
          child: BlocProvider(
            create: (context)=> GetAllUsersCubit()..getAllUsers(),
            child: BlocConsumer<GetAllUsersCubit,GetAllUsersStates>(
              listener: (context,state){
                print(state);
              },
              builder: (context,state){
                var cubit = GetAllUsersCubit.get(context);
                if(state is GetAllUsersLoadingStates){
                  return const Loading();
                }
                else{
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:(context,index)=> ChatItem(
                        userData: cubit.users[index],
                      ),
                      separatorBuilder: (context,index)=> SizedBox(
                        height: 15,
                      ),
                      itemCount: cubit.users.length,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
