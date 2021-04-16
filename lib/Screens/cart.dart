
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:two_c_cart/helper/constants.dart';


class CartScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: getAppBar('WHOLESALE','assets/images/search2.png',context),
      body:  getContent(),

    );
  }

  Widget getContent() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration:getContentBox,        // height: MediaQuery.of(context).size.height,

        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child:getMainHeading('Wishlist')),
            SliverToBoxAdapter(child:getWishlist()),
            SliverToBoxAdapter(child:getEmptyContainer()),
          ],
        ));
  }

  Widget getMainHeading(String title){
    return Container(
      margin: EdgeInsets.only(left: left,right: right,top: 30),
      child: Center(
        child:  Text(title,style: getMainHeadingText(primaryTextColor)),

      ),

    );

  }

  Widget getWishlist(){
    return Container(
      margin: EdgeInsets.only(left: 12,right: 12,top: top),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context,int index){
            return getWishlistItems();
          }
      ),

    );
  }

  Widget getWishlistItems(){
    double width = MediaQuery.of(context).size.width-25;
    double containerWidth = width;
    double imageWidth = 120;
    double iconWidth = 30;
    double detailsWidth = MediaQuery.of(context).size.width-220;
    double containerHeight = 100;
    return Container(
      width: containerWidth,
      // height:height,
      color: Colors.transparent,
      margin: EdgeInsets.only(right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    // height: containerHeight,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                            width: imageWidth,
                            child: Image.asset('assets/images/product1.png')),
                        VerticalDivider(thickness: 1,),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:detailsWidth,
                                child: Text('Tomato Tomato Tomato Tomato',style: getWishlistTitleText(primaryTextColor),maxLines: 2,overflow: TextOverflow.ellipsis,),

                              ),

                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('${'Rs'}${' 80'}',style: getWishlistTitleText(green),),),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('${'Quantity:'}${' 2'}',style: getSmallText(primaryTextColor),),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: iconWidth,
                          margin: EdgeInsets.only(right: 5,top: 15),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Image(image:
                                  AssetImage('assets/images/wishlist.png'),width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Image(image:
                                  AssetImage('assets/images/add_cart_blue.png'),width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  // size: 30,
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ))),

        ],
      ),


    );
  }

  Widget getEmptyContainer(){
    return Container();
  }
}
