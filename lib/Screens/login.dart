import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_c_cart/Screens/otp.dart';
import 'package:two_c_cart/Screens/register.dart';
import 'package:two_c_cart/helper/constants.dart';

import 'dashBoard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  String shopname;
  Widget getTextFormUser() {
    return TextFormField(
      obscureText: false,
      autofocus: false,
      onSaved: (value) {
        shopname = value;
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
        hintText: "User name",
        // labelText: 'Shop name',
        icon: Padding(
          padding: EdgeInsets.only(
              top: 0, bottom: 0, left: 10), // add padding to adjust icon
          child: ImageIcon(
            AssetImage("assets/images/user.png"),
            size: 20,
            color: colorPrimary,
          ),
        ),

        border: InputBorder.none,
      ),
    );
  }

  String password;
  Widget getTextFormPassWord() {
    return TextFormField(
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
          hintText: 'Password',
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
          icon:
          Padding(
            padding: EdgeInsets.only(
                top: 0, bottom: 0, left: 10), // add padding to adjust icon
            child: ImageIcon(
              AssetImage("assets/images/password.png"),
              size: 20,
              color: colorPrimary,
            ),
          ),

          border: InputBorder.none,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

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
          getForms(),
          getForgotPass(),
          getLoginButton(),
          getSignUp(),
        ],
      )

    );
}

  Widget getSignUp(){
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Already have not an Account?',style: TextStyle(fontSize: 12,letterSpacing: 0.5,color: primaryTextColor,fontFamily: 'opensans_semi_bold'),),
          InkWell(
              onTap: (){
                NextPage(context, RegisterScreen());
              },
              child: Text('Sign up!',style: TextStyle(fontSize: 12,letterSpacing: 0.5,color: colorPrimary,fontFamily: 'opensans_semi_bold'),)),
        ],
      ),
    );
}

  Widget getLoginButton(){
    return InkWell(
      onTap: (){
        NextPageReplacement(context,DashBoard());
              },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20,left: 30,right: 30),
        padding: EdgeInsets.only(top: 13,bottom: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: loginButtonColor
        ),
        child: Center(child: Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'opensans_bold',letterSpacing: 0.5),)),
      ),
    );
 }

  Widget getForgotPass(){
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    OtpScreen()));

      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 20),
        child: Text('Forgot Password',style: TextStyle(color: primaryTextColor,letterSpacing: 0.5,fontSize: 12,fontFamily: 'opensans_regular'),),
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
        'LOGIN',
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
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getTextFormPassWord(),
                  ))),
        ],
      ),
    );
  }
}
