import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_c_cart/Screens/PinFiels.dart';
import 'package:two_c_cart/Screens/register.dart';
import 'package:two_c_cart/helper/apiparams.dart';
import 'package:two_c_cart/helper/apiurldata.dart';
import 'package:two_c_cart/helper/constants.dart';
import 'package:two_c_cart/network/ApiCall.dart';
import 'package:two_c_cart/network/responses/otpresponse.dart';
import 'package:two_c_cart/notifiers/dataupdatenotifier.dart';

import 'dashBoard.dart';

class OtpScreen extends StatefulWidget {
  String phone;
  OtpScreen({this.phone});
  @override
  _OTPState createState() => _OTPState(phone: phone);
}

class _OTPState extends State<OtpScreen> {

  String phone;
  _OTPState({this.phone});
  DataUpdateNotifier _updateNotifier;
  @override
  void initState() {
    _updateNotifier =
        Provider.of<DataUpdateNotifier>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    _updateNotifier.reset();
    super.dispose();
  }
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
    return
      Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child:Container(
                // height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    children: [
                      getTopBanner(context),
                      getTitle(),
                      getForgotPassTitle(),
                      getOtp(),
                      getOtpButton(),
                      getResendOtp(),
                    ],
                  )

              )

          ),
          Align(alignment: Alignment.center,
            child: Consumer<DataUpdateNotifier>(
              builder: (context, value, child) {
                return value.isProgressShown ? progressBar : SizedBox();
              },
            ),)
        ],
      );

}
String otp;
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
          otp=pin;
          print("Completed: " + pin);
        },
        onChanged: (value) {
          // _otpNotifier.otpWithoutNotify = value;
        },
      ),
    );
  }
  Future<void> otpVerify(String otp,String phonenumber)
  async {
    _updateNotifier.isProgressShown = true;

    Map body = {
      // name,email,phone_number,password
      OTP: otp,
      PHONE_NUMBER: phonenumber,
    };
    ApiCall()
        .execute<OTPResponse, Null>(OTP_VERIFICATION_URL, body).then((OTPResponse result){
        _updateNotifier.isProgressShown = false;

        ApiCall().saveUserToken(result.usertoken);
        ApiCall().saveLoginResponse(result.toJson().toString());
        ApiCall().saveUserMobile(result.mobile);
        ApiCall().saveUserName(result.username);
        NextPageReplacement(context,DashBoard());
    });

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

  Widget getOtpButton(){
    return InkWell(
      onTap: (){
        if(otp!=null&&otp.length>3)
          otpVerify(otp, phone);
        else
          ApiCall().showToast("Enter valid otp");

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20,left: 30,right: 30),
        padding: EdgeInsets.only(top: 13,bottom: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: loginButtonColor
        ),
        child: Center(child: Text('VERIFY',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'opensans_bold',letterSpacing: 0.5),)),
      ),
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
