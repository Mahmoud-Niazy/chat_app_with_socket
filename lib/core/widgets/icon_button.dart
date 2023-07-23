import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
   final void Function()? onPressed;
   final IconData icon ;

   const CustomIconButton({super.key,
     required this.icon,
     required this.onPressed,
});


  @override
  Widget build(BuildContext context) {
  return IconButton(
  onPressed: onPressed, icon: Icon(icon),
  );
  }
}