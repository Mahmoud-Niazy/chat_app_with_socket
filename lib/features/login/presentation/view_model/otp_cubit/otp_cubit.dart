import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/login_repo_imp.dart';
import 'otp_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of<OtpCubit>(context);

  phoneAuth({
    required String phoneNumber,
  }) {
    emit(OtpLoadingState());
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  verificationCompleted(PhoneAuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
    emit(OtpSuccessfullyState());
  }

  verificationFailed(FirebaseAuthException exception) {
    emit(OtpExceptionState());
  }

  String? verificationId;

  codeSent(verificationId, resendToken) {
    this.verificationId = verificationId;
    emit(PhoneCorrectState());
  }

  codeAutoRetrievalTimeout(error) {
    emit(OtpTimeoutState());
  }

  checkCode({
    required String smsCode,
  }) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsCode,
    );
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      emit(OtpSuccessfullyState(uId: value.user!.uid,phone : value.user!.phoneNumber));
    }).catchError((error) {
      emit(CodeErrorState());
    });
  }

   checkIfUserExistOrNot({
    required String phone,
  }) async {
       return await LoginRepoImplementation().checkIfUserExistOrNot(phone: '+2$phone');
  }


}
