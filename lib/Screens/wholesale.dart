
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:two_c_cart/helper/constants.dart';


class WholeSaleScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<WholeSaleScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: getAppBar('WHOLESALE','assets/images/search2.png',context),
      body:  getContent(),
      bottomNavigationBar: getBottomNav(context),
    );
  }

  Widget getContent() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration:getContentBox,        // height: MediaQuery.of(context).size.height,

        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child:getMainHeading('Categories')),
            SliverPadding(padding: EdgeInsets.only(left: 12,right: 12,top: 20,bottom: top),sliver: getCategoryGrid()),
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

  Widget getCategoryGrid() {
    double width = MediaQuery.of(context).size.width-30;
    double containerWidth = (width-5)/2;
    double height = 110;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: containerWidth/height,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 5.0),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return _itemsBuilder(index,height-24);
        },
        childCount: 8,
      ),
    );
  }

  Widget _itemsBuilder(int index, double d) {
    return
      Container(
        height: d,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Container(
                child: Center(
                  child:Container(
                      height: d,
                      width: MediaQuery.of(context).size.width,

                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/bakery.jpg',
                        // image: '$bannerThumbUrl$url',
                        image:'assets/images/bakery.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text('Cakes & Bakery',style: getItemTextStyle(primaryTextColor),overflow: TextOverflow.ellipsis,maxLines: 1,))
        ],
    ),
      );
  }

  Widget getEmptyContainer(){
    return Container(

    );
  }
}
