import 'package:chat_app/core/utils/box_shadow.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? borderRadius;
  final String? Function(String?)? validator ;
  final TextEditingController controller ;
  final TextInputType? inputType ;

   const CustomTextFormField({
    super.key,
    required this.label,
     this.prefixIcon,
     this.borderRadius = 15,
    required this.validator,
    required this.controller,
     this.suffixIcon,
     this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!.r),
        color: Colors.white,
        boxShadow: [
         boxShadow,
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        cursorColor: ColorsManager.primaryColor,
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStylesManager.labelStyle,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: ColorsManager.primaryColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: ColorsManager.primaryColor,
          ),
          enabledBorder: InputBorder.none,
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius),
          //   borderSide:  BorderSide(
          //     color: ColorsManager.primaryColor,
          //     width: 2,
          //   ),
          // ),
          focusedBorder:InputBorder.none,
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius),
          //   borderSide:  BorderSide(
          //     color: ColorsManager.primaryColor,
          //   ),
          // ),
        ),
        validator: validator,
      ),
    );
  }
}
