import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:two_c_cart/Screens/home.dart';
import 'package:two_c_cart/Screens/wholesale.dart';
import 'package:two_c_cart/Screens/wholesaleValidation.dart';
import 'package:two_c_cart/helper/color_item)view.dart';
import 'package:two_c_cart/helper/constants.dart';

class DashBoard extends StatefulWidget {
  @override
  State createState() {
    return _State();
  }
}

class _State extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  List<TabItem> items = <TabItem>[
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.home, title: 'Favorite'),
    TabItem(icon: Icons.plus_one, title: 'Add'),
    TabItem(icon: Icons.plus_one, title: 'Profile'),
    TabItem(icon: Icons.plus_one, title: 'Cart'),
  ];

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        initialIndex: 2,
        length: items.length,
        child: Scaffold(
          body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              child: Center(child: Text('1')),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: white,
              child: Center(child: WholeSaleValidationScreen()),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: white,
              child: Center(child: HomeScreen()),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.orange,
              child: Center(child: Text('4')),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Center(child: Text('5')),
            ),
          ]),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(

              elevation: 0,
              centerTitle:true,
              automaticallyImplyLeading: false,
              title:Container(
                height: 78,
                child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: IconButton(
                      icon:Image.asset("assets/images/logo.png"),
                       iconSize: 58,
                        // color: primaryTextColor,
                      ),
                ),
              ),
              actions: [
                // action button
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon:Image.asset("assets/images/location.png"),
                    iconSize: 20,
                    // color: primaryTextColor,
                  ),
                ),
              ],
              leading: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Builder(
                  builder: (context) => IconButton(
                    icon:ImageIcon(AssetImage("assets/images/menu_icon.png"),
                            size: 25,
                            color: primaryTextColor,
                          ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
            ),
          ),

          drawer: getSideDrawer(),
          bottomNavigationBar:
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
          ),
        ));
  }
  Widget getSideDrawer()
  {
    return Container(
      color: Colors.white,
      child:Drawer(

        child: Container(
          color: white,
          height: double.infinity,

          child: SingleChildScrollView(

            child: Container(
              color: white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Container(
                      child: Container(

                          child:Container(

                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.only(bottomRight: Radius.circular(45.0)),
                                ),
                                height: 150,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 45, top: 30, bottom: 10),
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.grey[300],
                                        backgroundImage: AssetImage('assets/icons/no_image.png'
                                          // NetworkImage(''
                                          // profileData.user.getImage()
                                        ),

                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          SizedBox(
                                            width: 180,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Text("GUEST",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 180,

                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Text("email",
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 15)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))

                      )),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/edit_profile.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('My Profile',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {

                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/my_orders.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('My Orders',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/favourite.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('Wishlist',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/wallet.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('My Wallet',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/change_password.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('Change Password',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/stores.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('Stores',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/notification.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('Notifications',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/news_white.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('News',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {


                        },
                        ),
                        FlatButton(
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(AssetImage('assets/icons/log_out.png'),color: Colors.white,),
                              SizedBox(width: 10),
                              Text('Logout',style:TextStyle(color:Colors.white),)
                            ],
                          ), onPressed: () {
                        },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container tabContent(TabItem data, Color color) {
    return Container(
        height: 60,
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(data.icon, color: color),
            Text(data.title, style: TextStyle(color: color))
          ],
        ));
  }

  GridView paletteBody() {
    return GridView.count(
      crossAxisCount: 5,
      childAspectRatio: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 55;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 25;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 10, color: Colors.black);
  }
}
