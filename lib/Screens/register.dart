import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_c_cart/Screens/otp.dart';
import 'package:two_c_cart/helper/apiparams.dart';
import 'package:two_c_cart/helper/apiurldata.dart';
import 'package:two_c_cart/helper/constants.dart';
import 'package:two_c_cart/network/ApiCall.dart';
import 'package:two_c_cart/network/responses/registerresponse.dart';
import 'package:two_c_cart/notifiers/registernotifier.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<RegisterScreen> {
  bool _isObscure = true;
  String username;
  final GlobalKey<FormState> _userNameKey = GlobalKey();
  final GlobalKey<FormState> _passwordKey = GlobalKey();
  final GlobalKey<FormState> _phoneKey = GlobalKey();

  RegisterUpdateNotifier _updateNotifier;
  @override
  void initState() {
    _updateNotifier =
        Provider.of<RegisterUpdateNotifier>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    _updateNotifier.reset();
    super.dispose();
  }
  Widget getTextFormUser() {
    return Form(
      key: _userNameKey,
      child: TextFormField(
        obscureText: false,
        autofocus: false,
        onSaved: (value) {
          username = value;
        },
        validator: (value) {
          if (value.trim().isEmpty) {
            return 'This field is required';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          hintText: "Shop name",
          // labelText: 'Shop name',
          // icon: Padding(
          //   padding: EdgeInsets.only(
          //       top: 0, bottom: 0, left: 10), // add padding to adjust icon
          //   child: ImageIcon(
          //     AssetImage("assets/images/user.png"),
          //     size: 20,
          //     color: colorPrimary,
          //   ),
          // ),

          border: InputBorder.none,
        ),
      ),
    );
  }
  String phone;
  Widget getTextFormPhone() {
    return Form(
      key: _phoneKey,
      child: TextFormField(
        obscureText: false,
        autofocus: false,
        onSaved: (value) {
          phone = value;
        },
        validator: (value) {
          if (value.trim().isEmpty) {
            return 'This field is required';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          hintText: "Phone Number",
          // labelText: 'Shop name',
          // icon: Padding(
          //   padding: EdgeInsets.only(
          //       top: 0, bottom: 0, left: 10), // add padding to adjust icon
          //   child: ImageIcon(
          //     AssetImage("assets/images/user.png"),
          //     size: 20,
          //     color: colorPrimary,
          //   ),
          // ),

          border: InputBorder.none,
        ),
      ),
    );
  }

  String referral;
  Widget getTextFormReferral() {
    return TextFormField(
      obscureText: false,
      autofocus: false,
      onChanged: (value) {
        referral = value;
      },
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        hintText: "Referral Code*",
        // labelText: 'Shop name',
        // icon: Padding(
        //   padding: EdgeInsets.only(
        //       top: 0, bottom: 0, left: 10), // add padding to adjust icon
        //   child: ImageIcon(
        //     AssetImage("assets/images/user.png"),
        //     size: 20,
        //     color: colorPrimary,
        //   ),
        // ),

        border: InputBorder.none,
      ),
    );
  }

  String password;
  Widget getTextFormPassWord() {
    return Form(
      key: _passwordKey,
      child: TextFormField(
          obscureText: _isObscure,
          autofocus: false,
          onSaved: (value) {
            password = value;
          },
          validator: (value) {
            if (value.trim().isEmpty) {
              return 'This field is required';
            } else {
              return null;
            }
          },
          // keyboardType: TextInputType.done,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            // labelText: 'Shop name',
            hintText: 'Confirm Password',
            suffixIconConstraints:  BoxConstraints(
              minHeight: 20,
              minWidth: 25,
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage(_isObscure
                      ? ('assets/images/views.png')
                      : ('assets/images/view.png')
                  ),
                  size: 20,
                  // color: colorPrimary,
                ),
              ),
            ),
            // icon:
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: 0, bottom: 0, left: 10), // add padding to adjust icon
            //   child: ImageIcon(
            //     AssetImage("assets/images/password.png"),
            //     size: 20,
            //     color: colorPrimary,
            //   ),
            // ),

            border: InputBorder.none,
          )),
    );
  }
  String repassword;
  Widget getTextFormRePassWord() {
    return TextFormField(
        obscureText: _isObscure,
        autofocus: false,
        onSaved: (value) {
          repassword = value;
        },
        validator: (value) {
          if (value.trim().isEmpty) {
            return 'This field is required';
          } else {
            return null;
          }
        },
        // keyboardType: TextInputType.done,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          // labelText: 'Shop name',
          hintText: 'Confirm Password',
          suffixIconConstraints:  BoxConstraints(
            minHeight: 20,
            minWidth: 25,
          ),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ImageIcon(
                AssetImage(_isObscure
                    ? ('assets/images/views.png')
                    : ('assets/images/view.png')
                ),
                size: 20,
                // color: colorPrimary,
              ),
            ),
          ),
          // icon:
          // Padding(
          //   padding: EdgeInsets.only(
          //       top: 0, bottom: 0, left: 10), // add padding to adjust icon
          //   child: ImageIcon(
          //     AssetImage("assets/images/password.png"),
          //     size: 20,
          //     color: colorPrimary,
          //   ),
          // ),

          border: InputBorder.none,
        ));
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
        // physics: NeverScrollableScrollPhysics(),
          child:getContent() ),
    );
  }
  Future<void> register(String username,String phonenumber,String password,String refCode)
  async {
   _updateNotifier.isProgressShown = true;

    Map body = {

      USER_NAME:username,
      REF_CODE:refCode,
      PASSWORD:password,
      PHONE_NUMBER: phonenumber,
    };
    ApiCall()
        .execute<RegisterResponse, Null>(REGISTER_URL, body).then((RegisterResponse result){
      _updateNotifier.isProgressShown = false;
      if(result.success=="1")
      {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => OtpScreen()));
      }

    });

  }
Widget getContent(){
    return
      Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                // height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    children: [
                      getTopBanner(context),
                      getTitle(),
                      getForms(),
                      getRegisterButton(),

                    ],
                  )

              )

          ),
          Align(alignment: Alignment.center,
            child: Consumer<RegisterUpdateNotifier>(
              builder: (context, value, child) {
                return value.isProgressShown ? progressBar : SizedBox();
              },
            ),)
        ],
      );

}
 Widget getRegisterButton(){
    return InkWell(
      onTap: (){
        if(_userNameKey.currentState.validate()&&_passwordKey.currentState.validate()&&_phoneKey.currentState.validate())
        {
          _userNameKey.currentState.save();
          _passwordKey.currentState.save();
          _phoneKey.currentState.save();
          register(username,phone, password,referral);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20,left: 30,right: 30,bottom: 20),
        padding: EdgeInsets.only(top: 13,bottom: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: loginButtonColor
        ),
        child: Center(child: Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'opensans_bold',letterSpacing: 0.5),)),
      ),
    );
 }

  Widget getTopBanner(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Image.asset('assets/images/register.jpg'),
    );
  }

  Widget getTitle() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        'REGISTER',
        style: TextStyle(
            color: primaryTextColor,
            fontSize: 25,
            fontFamily: 'opensans_bold',
            // fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
    );
  }

  Widget getForms() {
    return Container(
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Card(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getTextFormUser(),
                  ))),
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Card(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getTextFormPhone(),
                  ))),
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Card(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getTextFormReferral(),
                  ))),
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Card(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getTextFormPassWord(),
                  ))),
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Card(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getTextFormRePassWord(),
                  ))),
        ],
      ),
    );
  }
}
