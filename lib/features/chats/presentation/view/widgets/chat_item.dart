import 'package:chat_app/core/utils/routes.dart';
import 'package:chat_app/features/chat_details/presentation/view/chat_details_view.dart';
import 'package:chat_app/features/enter_your_information/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../../../core/utils/text_styles.dart';

class ChatItem extends StatelessWidget {
  final UserDataModel userData;

  const ChatItem({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigate(
          context: context,
          route: RoutesManager.chatDetails,
          page: ChatDetailsView(),
          argument: {
            'userData' : userData ,
          },
        );
      },
      child: Row(
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(userData.image!),
                )),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Text(
              userData.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStylesManager.labelLarge20,
            ),
          ),
        ],
      ),
    );
  }
}
