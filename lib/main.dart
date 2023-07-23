import 'package:chat_app/core/utils/routes.dart';
import 'package:chat_app/features/login/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> OtpCubit()..checkIfUserExistOrNot(phone: '01062676647')),
        ],
        child: MaterialApp(
          routes: RoutesManager.routes,
          initialRoute: RoutesManager.splashRoute,
          theme: ThemeData(
              progressIndicatorTheme: ProgressIndicatorThemeData(
              color:ColorsManager.primaryColor,
            )
          ),
        ),
      ),
    );
  }
}