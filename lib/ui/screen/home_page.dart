import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greentickpracticaldemo/ui/widget/app_circle_image.dart';
import 'package:greentickpracticaldemo/ui/widget/app_textview.dart';
import 'package:greentickpracticaldemo/utils/colors.dart';
import 'package:greentickpracticaldemo/utils/math_utils.dart';
import 'package:greentickpracticaldemo/utils/constants/app_constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BuildContext temp;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    temp = context;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Green tick'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: getSize(16, temp), right: getSize(16, temp)),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: getSize(12, temp)),
                  child: getLineView()),
              recommdedView(),
              listCardView(),
              Container(
                  margin: EdgeInsets.only(top: getSize(12, temp)),
                  child: getLineView()),
            ],
          ),
        ),
      ),
    ));
  }

  Widget listCardView() {
    return Container(

        height: getSize(200, temp),
        //width: getSize(260, temp),
        margin: EdgeInsets.only(top: getSize(12, temp)),

        child: ListView.builder(
          itemBuilder: (context, index) {
            return _buildListWidget();
          },
          //physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
        ));
  }

  Widget _buildListWidget() {
    return Container(
      //padding: EdgeInsets.only(left: ),
      //color: AppColor.color243B77,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: 220,
            child: Container(
              margin: EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1500622944204-b135684e99fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1161&q=80'), //NetworkImage
                  scale: 1.0,
                ), //DecprationImage
                border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                    style: BorderStyle.solid), //Border.all

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white10,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ), //BoxDecoration
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: getSize(8, temp)),
            child: AppTextView("Markia Spa Sports city",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.colorFontColor)),
          ),
          Container(

            padding: EdgeInsets.only(left: 25),
            margin: EdgeInsets.only(top: getSize(4, temp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: getSize(1, temp)),
                  child: AppImageView(
                      url: AppConst.assets.imgLikeGreen, width: 20, height: 20),
                ),
                Container(
                  margin: EdgeInsets.only(left: getSize(4, temp)),
                  child: AppTextView("1.3k",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorFontGrey)),
                ),
                Container(
                    margin: EdgeInsets.only(left: getSize(8, temp)),
                    child: AppImageView(
                        url: AppConst.assets.imgUnlikeBrown,
                        width: 20,
                        height: 20)),
                Container(
                  margin: EdgeInsets.only(left: getSize(4, temp)),
                  child: AppTextView("105",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorFontGrey)),
                ),
                Center(
                  child: Container(
                    width: 140,
                    child: RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 3,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                      itemBuilder: (context, _) => Container(
                        width: 12,
                        height: 12,
                        child: IconButton(
                          padding: new EdgeInsets.all(0.0),
                          icon : new Icon(Icons.star, size: 6.0),
                          color: AppColor.colorFontColor
                          , onPressed: () {  },
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget recommdedView() {
    return Container(
      margin: EdgeInsets.only(top: getSize(12, temp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            AppImageView(
              url: AppConst.assets.imgLikeBrown,
              height: 32,
              width: 32,
            ),
            AppTextView(
              "Recommended for you",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColor.colorBrown),
            )
          ]),
          AppTextView(
            "View All",
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.colorBrown),
          )
        ],
      ),
    );
  }

  Widget getLineView() {
    return Container(
      width: double.infinity,
      height: getSize(1, temp),
      color: AppColor.colorFontColor,
    );
  }
}
