import 'package:chat_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStylesManager{

  //Login in Login View
  static TextStyle labelLarge30 = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 30.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle labelLarge20  = TextStyle(
    color : ColorsManager.blackColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  //label in TextFormField
  static TextStyle labelStyle = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 15.sp,
  );
}