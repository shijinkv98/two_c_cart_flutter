import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_c_cart/Screens/wholesale.dart';
import 'package:two_c_cart/Screens/wholesaleValidation.dart';
import 'package:two_c_cart/helper/constants.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:two_c_cart/helper/file_model.dart';
import 'package:two_c_cart/notifiers/documents_notifier.dart';
import 'package:two_c_cart/notifiers/homenotifier.dart';


class HomeScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<HomeScreen> {
  CountDownController _controller = CountDownController();
  int _duration = 360;
  String productOne;
  HomeUpdateNotifier _updateNotifier;
  @override
  void initState() {
    _updateNotifier =
        Provider.of<HomeUpdateNotifier>(context, listen: false);
    _docsAddedNotifier =
        Provider.of<DocsAddedNotifier>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    _updateNotifier.reset();
    super.dispose();
  }
  DocsAddedNotifier _docsAddedNotifier;

  Widget getProductOne() {
    double width = MediaQuery.of(context).size.width - 40;
    return Container(
      decoration: homeBox,
      margin: EdgeInsets.only(left: 15, right: 10, top: 10),
      width: width * 0.6,
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          obscureText: false,
          autofocus: false,
          onSaved: (value) {
            productOne = value;
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
            isDense: true,
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            hintText: "Product Name",
            hintStyle: hintStyleHome,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  String quantityone;
  Widget getQuantityOne() {
    double width = MediaQuery.of(context).size.width - 40;
    return Container(
      decoration: homeBox,
      margin: EdgeInsets.only(right: 15, top: 10),
      width: width * 0.4,
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          obscureText: false,
          autofocus: false,
          onSaved: (value) {
            quantityone = value;
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
            isDense: true,
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            hintText: "Qty",
            hintStyle: hintStyleHome,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   _docsAddedNotifier =
  //       Provider.of<DocsAddedNotifier>(context, listen: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body:  getContent(),
    );
  }

  Widget getContent() {
    return Container(
        // height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(child:getSearch()),
            SliverToBoxAdapter(child:getTopBanner(context)),
            SliverToBoxAdapter(child:getTitle('I want these items')),
            SliverToBoxAdapter(child:getList()),
            SliverToBoxAdapter(child:getAddButton()),
            SliverToBoxAdapter(child:getDivider()),
            SliverToBoxAdapter(child:getTitle('Scan My List')),
            SliverToBoxAdapter(child:getUploadButton()),
            SliverToBoxAdapter(child:getFormatText()),
            SliverToBoxAdapter(child:getOfferBanner()),
            SliverToBoxAdapter(child:getCategoryList()),
            SliverToBoxAdapter(child:getMainHeading('Categories',0)),
            SliverPadding(padding: EdgeInsets.only(left: 12,right: 12,top: top,bottom: top),sliver: getCategoryGrid()),
            SliverToBoxAdapter(child:getBg()),
            SliverToBoxAdapter(child:getMainHeading('MLM Categories',1)),
            SliverToBoxAdapter(child:getMLMCategories()),
            SliverToBoxAdapter(child:getEmptyContainer()),

          ],
        ));
  }

  Widget getList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return getForms();
          }),
    );
  }

  Widget getForms() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [getProductOne(), getQuantityOne()],
          )
        ],
      ),
    );
  }

  Widget getSearch() {
    return Container(
      margin: EdgeInsets.only(left: 14, right: 14, top: 10),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Card(
        elevation: 5,
      ),
    );
  }

  Widget getTopBanner(BuildContext context) {
    double w1 = 1007;
    double h1 = 392;
    double w2 = MediaQuery.of(context).size.width - 30;
    double h2 = (h1 / w1) * w2;
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: top),
      // height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        height: h2,
        child: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/delivery_bg.jpg',
                fit: BoxFit.fitWidth,
              )),
          Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Hire a Delivery Person Timer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'opensans_bold'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: right,top: top),
                        child: Column(
                          children: [
                            getTimerHour(),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("HOURS",style: TextStyle(color: white,fontFamily: 'opensans_bold',fontSize: 8),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,top: top),
                        child: Column(
                          children: [
                            getTimerMinute(),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("MINUTES",style: TextStyle(color: white,fontFamily: 'opensans_bold',fontSize: 8),),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,top: top),
                        child: Column(
                          children: [
                            getTimerSeconds(),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("SECONDS",style: TextStyle(color: white,fontFamily: 'opensans_bold',fontSize: 8),),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        ]),
      ),
    );
  }

  Widget getTitle(String title) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: 15),
      child: Text(title, style: headlineText),
    );
  }

  Widget getAddButton() {
    return Container(
      margin: EdgeInsets.only(left: left, top: top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){

            },
            child: Container(
                width: 40,
                height: commonButtonHeight,
                padding: EdgeInsets.all(10),
                decoration: getCommonBox(colorPrimary),
                child: Image.asset(
                  'assets/images/add.png',
                  color: white,
                )),
          ),
          InkWell(
            onTap: (){

            },
            child: Container(
                width: 120,
                height: commonButtonHeight,
                margin: EdgeInsets.only(left: 5),
                // padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
                decoration: getCommonBox(loginButtonColor),
                child: Center(child: Text('SEND', style: buttonTextStyle))),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return Container(
        height: 1,
        margin: EdgeInsets.only(left: left, right: right, top: top),
        child: Divider(thickness: 1));
  }

  Widget getUploadButton() {
    FileModel _regstraionDoc;
    return InkWell(
      onTap: ()  async{
        final _allowedDocuments = ['png', 'pdf', 'jpg'];
        // FilePickerResult result =
        // await FilePicker.platform.pickFiles(
        //   type: FileType.custom,
        //   allowedExtensions: _allowedDocuments,
        // );
        // if (result != null) {
        //   _regstraionDoc = FileModel(
        //       fileName: result.files.single.name,
        //       imageStr: result.files.single.path,
        //       imageU8L: result.files.single.bytes);
        //   _docsAddedNotifier.docAdded();
        // }

      },
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: top),
        height: commonButtonHeight,
        decoration: getCommonBox(loginButtonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage('assets/images/upload.png'),
              color: white,
            ),
            Text('${"\t"}${"\t"}${"UPLOAD LIST / CAPTURE LIST"}',
                style: buttonTextStyle),
          ],
        ),
      ),
    );
  }

  Widget getFormatText() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(left: left, right: right, top: top),
          child: Text(
            'File format jpg, png and pdf, Size: 20Kb',
            style: TextStyle(
                color: hintColor, fontSize: 10, fontFamily: 'opensans_italic'),
          )),
    );
  }

  Widget getEmptyContainer() {
    return Container(
      height: commonButtonHeight,
    );
  }

  Widget getOfferBanner() {
    final List<String> list = ["",""];
    bool autoPlay = true;
    return Container(
      margin: EdgeInsets.only(top: top,bottom: top),
      height: 115,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
      image: AssetImage('assets/images/offerbg.png'),
        fit: BoxFit.fitWidth
    )
      ),
      child:Container(
        margin: EdgeInsets.only(left:55,right: 5,bottom: 15),
        child: Center(
            child:CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: autoPlay,
              aspectRatio: MediaQuery.of(context).size.width/50,
              autoPlayCurve: Curves.easeIn,
              enableInfiniteScroll: autoPlay,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1.0,

            ),
        items: list.map((item) => Container(
          child:getOfferText(),

        )).toList(),
      )
    ),


        ),
      );
  }

  Widget getOfferText(){
    return Container(
      child:Center(
        child: Html(data: '${"Take an extra\t"}${"<b>10"}${"%</b>\t"}${"off, sales items. With code\t"}${"<b>KITOFF10</b>"}',
         defaultTextStyle: TextStyle(color: white,fontSize: 13,) ,
        ),
      ) ,
    );
  }

  Widget getCategoryList(){
    return Container(
      height: 120,

      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          return getCategoryItem(position);
        },
      ),
    );
  }

  Widget getCategoryItem(int index) {


    int mul = index % 3;
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.only(left: left),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: mul==0?pink:mul==1?blue:violet,
                ),
              width: 120,
                // width: double.infinity,
                height: 120,



                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/images/logo.png',
                      image: 'assets/images/home_feast.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Home Feast',style: getItemTextStyle(white)),
                    )],
                )),
          ),

        ],
      ),
    );
  }

  Widget getMainHeading(String title,int type){
    return Container(
      margin: EdgeInsets.only(left: left,right: right,top: top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: getMainHeadingText(primaryTextColor)),
          InkWell(
              onTap: (){
                switch(type)
                {
                  case 0:
                    NextPage(context,WholeSaleScreen());
                    break;
                  case 1:
                    NextPage(context,WholeSaleValidationScreen());
                    break;
                }

              },
              child: Text('VIEW ALL',style: getMainHeadingTextUnderLine(primaryTextColor))),
        ],
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

  Widget getBg(){
    return Container(
      height: 6,
      color: bg,
    );
  }

  Widget getMLMCategories(){
    return Container(
      margin: EdgeInsets.only(left: 12,right: 12,top: top),
      height: 110,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
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
                  child: Image.asset('assets/images/category2.jpg'))),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text('Category',style: getItemTextStyle(primaryTextColor),overflow: TextOverflow.ellipsis,maxLines: 1,))

        ],
      ),


    );
  }

  Widget getTimerHour(){
    return Container(
      height: 40,

      width: 40,
      child:
      CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: _duration,

        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,

        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery
            .of(context)
            .size
            .width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery
            .of(context)
            .size
            .height / 2,

        // Ring Color for Countdown Widget.
        ringColor: Colors.grey[700],

        // Ring Gradient for Countdown Widget.
        ringGradient: null,

        // Filling Color for Countdown Widget.
        fillColor: white,

        // Filling Gradient for Countdown Widget.
        fillGradient: null,

        // Background Color for Countdown Widget.
        backgroundColor: Colors.transparent,

        // Background Gradient for Countdown Widget.
        backgroundGradient: null,

        // Border Thickness of the Countdown Ring.
        strokeWidth: 2.0,

        // Begin and end contours with a flat edge and no extension.
        strokeCap: StrokeCap.round,

        // Text Style for Countdown Text.
        textStyle: TextStyle(
            fontSize: 15.0,
            color: white,
            fontWeight: FontWeight.bold),

        // Format for the Countdown Text.
        textFormat: CountdownTextFormat.MM_SS,

        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverse: true,

        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isReverseAnimation: false,

        // Handles visibility of the Countdown Text.
        isTimerTextShown: true,

        // Handles the timer start.
        autoStart: true,

        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
          print('Countdown Started');
        },

        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          print('Countdown Ended');
        },
      ),
    );
  }

  Widget getTimerMinute(){
    return Container(
      height: 40,

      width: 40,
      child:
      CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: _duration,

        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,

        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery
            .of(context)
            .size
            .width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery
            .of(context)
            .size
            .height / 2,

        // Ring Color for Countdown Widget.
        ringColor: Colors.grey[700],

        // Ring Gradient for Countdown Widget.
        ringGradient: null,

        // Filling Color for Countdown Widget.
        fillColor: white,

        // Filling Gradient for Countdown Widget.
        fillGradient: null,

        // Background Color for Countdown Widget.
        backgroundColor: Colors.transparent,

        // Background Gradient for Countdown Widget.
        backgroundGradient: null,

        // Border Thickness of the Countdown Ring.
        strokeWidth: 2.0,

        // Begin and end contours with a flat edge and no extension.
        strokeCap: StrokeCap.round,

        // Text Style for Countdown Text.
        textStyle: TextStyle(
            fontSize: 15.0,
            color: white,
            fontWeight: FontWeight.bold),

        // Format for the Countdown Text.
        textFormat: CountdownTextFormat.SS,

        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverse: true,

        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isReverseAnimation: false,

        // Handles visibility of the Countdown Text.
        isTimerTextShown: true,

        // Handles the timer start.
        autoStart: true,

        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
          print('Countdown Started');
        },

        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          print('Countdown Ended');
        },
      ),
    );
  }

  Widget getTimerSeconds(){
    return Container(
      height: 40,

      width: 40,
      child:
      CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: _duration,

        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,

        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery
            .of(context)
            .size
            .width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery
            .of(context)
            .size
            .height / 2,

        // Ring Color for Countdown Widget.
        ringColor: Colors.grey[700],

        // Ring Gradient for Countdown Widget.
        ringGradient: null,

        // Filling Color for Countdown Widget.
        fillColor: white,

        // Filling Gradient for Countdown Widget.
        fillGradient: null,

        // Background Color for Countdown Widget.
        backgroundColor: Colors.transparent,

        // Background Gradient for Countdown Widget.
        backgroundGradient: null,

        // Border Thickness of the Countdown Ring.
        strokeWidth: 2.0,

        // Begin and end contours with a flat edge and no extension.
        strokeCap: StrokeCap.round,

        // Text Style for Countdown Text.
        textStyle: TextStyle(
            fontSize: 15.0,
            color: white,
            fontWeight: FontWeight.bold),

        // Format for the Countdown Text.
        textFormat: CountdownTextFormat.SS,

        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverse: true,

        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isReverseAnimation: false,

        // Handles visibility of the Countdown Text.
        isTimerTextShown: true,

        // Handles the timer start.
        autoStart: true,

        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
          print('Countdown Started');
        },

        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          print('Countdown Ended');
        },
      ),
    );
  }

}
