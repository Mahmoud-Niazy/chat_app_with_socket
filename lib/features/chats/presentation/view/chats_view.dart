import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/text_styles.dart';
import 'package:chat_app/core/widgets/loading.dart';
import 'package:chat_app/features/chats/presentation/view/widgets/chats_view_body.dart';
import 'package:chat_app/features/chats/presentation/view_model/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/get_user_data_cubit/get_user_data_states.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({
    super.key,
  });

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatsViewBody(),
      drawer: BlocProvider(
        create: (context) => GetUserDataCubit()..getUserData(),
        child: BlocConsumer<GetUserDataCubit, GetUserDataStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetUserDataLoadingState) {
              return const Loading();
            }
            if(state is GetUserDataSuccessfullyState) {
              var cubit = GetUserDataCubit.get(context);
              return Container(
                padding: const EdgeInsets.all(50.0),
                color: ColorsManager.primaryColor.withOpacity(.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.r,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(cubit.userData!.image!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      cubit.userData!.name!,
                      style: TextStylesManager.labelLarge20,
                    ),
                    Text(
                      cubit.userData!.phone!,
                      style: TextStylesManager.labelLarge15,
                    ),
                  ],
                ),
              );
            }
            else{
              return const Column();
            }
          },
        ),
      ),
    );
  }
}
