
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:two_c_cart/helper/constants.dart';


class WishlistScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<WishlistScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body:  getContent(),

    );
  }

  Widget getContent() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration:getContentBoxType2,        // height: MediaQuery.of(context).size.height,

        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child:getMainHeading('Wishlist')),
            SliverToBoxAdapter(child:getMLMCategories()),
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

  Widget getMLMCategories(){
    return Container(
      margin: EdgeInsets.only(left: 12,right: 12,top: top),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context,int index){
            return getMLMCaregoriesList();
          }
      ),

    );
  }

  Widget getMLMCaregoriesList(){
    double width = MediaQuery.of(context).size.width-25;
    double containerWidth = (width-5)/2;
    double height = 110;
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
                    height: 100,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                            width: 120,
                            child: Image.asset('assets/images/product1.png')),
                        VerticalDivider(thickness: 1,),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                child: Text('Tomato',style: getWishlistTitleText(primaryTextColor),maxLines: 2,overflow: TextOverflow.ellipsis,),

                              ),

                              Container(
                                child: Text('${'Rs'}${' 80'}',style: getWishlistTitleText(green),),),
                              Container(

                                child: Text('${'Quantity:'}${' 2'}',style: getSmallText(primaryTextColor),),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/time.png'),
                                size: 20,
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
    return Container(

    );
  }
}
