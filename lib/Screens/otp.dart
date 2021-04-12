import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_c_cart/Screens/PinFiels.dart';
import 'package:two_c_cart/Screens/register.dart';
import 'package:two_c_cart/helper/constants.dart';

class OtpScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<OtpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          // behavior: HitTestBehavior.translucent,
          child: Icon(Icons.arrow_back,color:Colors.black,size: 30,
          ),
        ),



        elevation: 0,
      ),
      body: SingleChildScrollView(
          child:getContent() ),
    );
  }

  Widget getContent(){
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: [
          getTopBanner(context),
          getTitle(),
          getForgotPassTitle(),
          getOtp(),
          getLoginButton(),
          getResendOtp(),
        ],
      )

    );
}

  Widget getOtp(){
    return Container(
      margin: EdgeInsets.only(top: 25,left: 45,right: 45,bottom: 35),
      child: OTPTextField(
        // key:_otpKey,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        // otp: _otpNotifier.otp,
        fieldStyle: FieldStyle.underline,

        style: TextStyle(fontSize: 25),
        onCompleted: (pin) {
          // _otpNotifier.otpWithoutNotify = pin;
          print("Completed: " + pin);
        },
        onChanged: (value) {
          // _otpNotifier.otpWithoutNotify = value;
        },
      ),
    );
  }

  Widget getResendOtp(){
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Did not receive the verification OTP? ',style: TextStyle(fontSize: 13,letterSpacing: 0.5,color: primaryTextColor,fontFamily: 'opensans_regular'),),
          InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RegisterScreen()));

              },
              child: Text('Resend ',style: TextStyle(fontSize: 13,letterSpacing: 0.5,color: primaryTextColor,fontFamily: 'opensans_bold'),)),
            Text('again',style: TextStyle(fontSize: 13,letterSpacing: 0.5,color: primaryTextColor,fontFamily: 'opensans_regular'),),
        ],
      ),
    );
}

  Widget getLoginButton(){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20,left: 30,right: 30),
      padding: EdgeInsets.only(top: 13,bottom: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: loginButtonColor
      ),
      child: Center(child: Text('VERIFY',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'opensans_bold',letterSpacing: 0.5),)),
    );
 }

  Widget getForgotPassTitle(){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 15,left: 30,right: 30),
      child: Center(child: Text('${"We will send you a One Time Password on"}${'\n'}${" your phone number"}',style: TextStyle(color: primaryTextColor,letterSpacing: 0.5,fontSize: 13,fontFamily: 'opensans_regular'),textAlign: TextAlign.center,)),
    );
  }

  Widget getTopBanner(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Image.asset('assets/images/otp.jpg'),
    );
  }

  Widget getTitle() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        'OTP VERIFICATION',
        style: TextStyle(
            color: primaryTextColor,
            fontSize: 25,
            fontFamily: 'opensans_bold',
            // fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
    );
  }

}
