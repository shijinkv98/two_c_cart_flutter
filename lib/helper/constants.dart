import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:two_c_cart/Screens/dashBoard.dart';
import 'package:two_c_cart/Screens/home.dart';
import 'package:two_c_cart/Screens/wholesale.dart';

const Color colorPrimary = const Color.fromRGBO(11, 63, 139, 1.0);
const Color appBarColor = Color(0xFF0a3a80);
const Color primaryTextColor = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color pink = Color(0xFFee6bb7);
const Color blue = Color(0xFF63a4f4);
const Color violet = Color(0xFF9874f2);
const Color hintColor = Color(0xFF9E9E9E);
const Color green = Color(0xFF1dae11);
const Color boxBorder = Color(0xFF9E9E9E);
const Color loginButtonColor = Color(0xfffd1000);
const Color bg = Color(0xffececec);
const double commonButtonHeight = 40;
const double left = 15;
const double right = 15;
const double top = 15;
const double register_icon_size = 10.0;

const TextStyle hintStyleHome =TextStyle(color: hintColor, fontFamily: 'opensans_light', fontSize: 14);

const TextStyle headlineText =TextStyle(color: primaryTextColor, fontFamily: 'opensans_semi_bold', fontSize: 15,letterSpacing: 1);

const TextStyle buttonTextStyle =TextStyle(color: white, fontFamily: 'opensans_bold', fontSize: 12,);

TextStyle getItemTextStyle(Color textColor){
   return TextStyle(color: textColor, fontFamily: 'opensans_bold', fontSize: 10,letterSpacing: 0.5);
}
TextStyle getAppBarTitleStyle(){
   return TextStyle(color: white, fontFamily: 'opensans_bold', fontSize: 20,letterSpacing: 0.5);
}
TextStyle getMainHeadingText(Color textColor){
   return TextStyle(color: textColor, fontFamily: 'opensans_semi_bold', fontSize: 16,letterSpacing: 0.5);
}
TextStyle getWishlistTitleText(Color textColor){
   return TextStyle(color: textColor, fontFamily: 'opensans_semi_bold', fontSize: 14,letterSpacing: 0.5);
}
TextStyle getText(Color textColor){
   return TextStyle(color: textColor, fontFamily: 'opensans_bold', fontSize: 18,letterSpacing: 0.5,);
}
TextStyle getMainHeadingTextUnderLine(Color textColor){
   return TextStyle(color: textColor, fontFamily: 'opensans_bold', fontSize: 9,letterSpacing: 0.5,decoration: TextDecoration.underline,);
}
TextStyle getSmallText(Color textColor){
   return TextStyle(color: textColor, fontFamily: 'opensans_regular', fontSize: 10,letterSpacing: 0.5,);
}
BoxDecoration homeBox = BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2)),
    border: Border.all(color: boxBorder, width: 0.5));

BoxDecoration getContentBox = BoxDecoration(
    borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25)),color: Colors.white);
BoxDecoration getContentBoxType2 = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: colorPrimary,
        offset: const Offset(
          5.0,
          5.0,
        ),
        blurRadius: 10.0,
        spreadRadius: 3.0,
      ), //BoxShadow
          ],
    borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25)),color: Colors.white);

BoxDecoration getCommonBox(Color fillcolor)
{
    return BoxDecoration(color: fillcolor,
        borderRadius:BorderRadius.all(Radius.circular(3)));
}
BoxDecoration getCommonOutlineBox(Color outlineColor)
{
    return  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: outlineColor, width: 0.5));
}
BoxDecoration getBgBox(assetImage)
{
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage(assetImage
            ),
            fit: BoxFit.fill
        )
    );
}
NextPageReplacement(BuildContext context, nextpage) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => nextpage));
}
NextPage(BuildContext context, nextpage) {
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => nextpage));
}
Widget getAppBar(String title,assetImage){
  return AppBar(
    backgroundColor: appBarColor,
    title: Text(title,style: getAppBarTitleStyle()),
    centerTitle: true,
    elevation: 0,
    automaticallyImplyLeading: true,
    actions:[
      Container(
        margin: EdgeInsets.only(right: right),
        child: ImageIcon(
          AssetImage(assetImage),
          color: white,
        ),
      ),
  ]
  );
}

Widget getBottomNav(BuildContext context){
  // List<TabItem> items = <TabItem>[
  //   TabItem(icon: Icons.home, title: 'Home'),
  //   TabItem(icon: Icons.home, title: 'Favorite'),
  //   TabItem(icon: Icons.plus_one, title: 'Add'),
  //   TabItem(icon: Icons.plus_one, title: 'Profile'),
  //   TabItem(icon: Icons.plus_one, title: 'Cart'),
  // ];
  return
  //   DefaultTabController(
  //     initialIndex: 2,
  //     length: items.length,
  //     child: Scaffold(
  //     body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
  // Container(
  // width: double.infinity,
  // height: MediaQuery.of(context).size.height,
  // color: Colors.red,
  // child: Center(child: Text('1')),
  // ),
  // Container(
  // width: double.infinity,
  // height: MediaQuery.of(context).size.height,
  // color: white,
  // child: Center(child: WholeSaleScreen()),
  // ),
  // Container(
  // width: double.infinity,
  // height: MediaQuery.of(context).size.height,
  // color: white,
  // child: Center(child: HomeScreen()),
  // ),
  // Container(
  // width: double.infinity,
  // height: MediaQuery.of(context).size.height,
  // color: Colors.orange,
  // child: Center(child: Text('4')),
  // ),
  // Container(
  // width: double.infinity,
  // height: MediaQuery.of(context).size.height,
  // color: Colors.blue,
  // child: Center(child: Text('5')),
  // ),
  // ]),
  // bottomNavigationBar:

    StyleProvider(
    style: Style(),
    child: ConvexAppBar(
      // disableDefaultTabController: true,
      height: 60,
      top: -20,
      curveSize: 60,
      elevation: 0,
      style: TabStyle.fixedCircle,
      items: [
        TabItem(
          title: 'Home',
          icon: ImageIcon(
            AssetImage("assets/images/home.png"),
            size: 25,
            color: primaryTextColor,
          ),
        ),
        TabItem(
          title: 'Favorite',
          icon: ImageIcon(
            AssetImage("assets/images/favorate.png"),
            size: 25,
            color: primaryTextColor,
          ),),
        TabItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child:
              Image.asset("assets/images/logo.png"),
            )
        ),
        TabItem(
          title: "Profile",
          icon:
          ImageIcon(
            AssetImage("assets/images/profile.png"),
            size: 20,
            color: primaryTextColor,
          ),),
        TabItem(
          title: "Cart",
          icon: ImageIcon(
            AssetImage("assets/images/cart.png"),
            size: 20,
            color: primaryTextColor,
          ),),
      ],
      activeColor: Colors.black,
      backgroundColor: white,
      cornerRadius: 0,
    ),
  );
}