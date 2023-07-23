abstract class OtpStates{}

class OtpInitialState extends OtpStates{}

class OtpLoadingState extends OtpStates{}
class PhoneCorrectState extends OtpStates{}
class OtpSuccessfullyState extends OtpStates{
  String? uId ;
  String? phone ;

  OtpSuccessfullyState({this.uId,this.phone});
}
class OtpExceptionState extends OtpStates{}
class OtpTimeoutState extends OtpStates{}
class CodeErrorState extends OtpStates{}

