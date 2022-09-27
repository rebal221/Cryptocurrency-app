import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:mining_sett/utils/auth_provider.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

AuthProvider auth = AuthProvider();

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHieght = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(height: 40),
              Text(
                Languages.of(context)!.titleBlog,
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 25, color: Colors.black),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              FutureBuilder(
                future: auth.get_Blogs(),
                builder: (context, dynamic snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/loading.gif",
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                        children: List.generate(snapshot.data.length,
                            (index) => BuildCard(snapshot.data, index)));
                  }
                },
              ),
              SizedBox(height: 30),
              MediaQuery.of(context).size.width < 900
                  ? FooterScetionMobile()
                  : FooterScetionWeb()
            ])));
  }

  Widget BuildCard(List blogs, int index) {
    int ratinggg = 0;
    DateTime now = DateTime.now();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHieght = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: screenWidth > 1000
            ? screenWidth / 3
            : (screenWidth > 600 ? 400 : screenWidth),
        // height: screenHieght / 3,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.005,
                blurRadius: 9,
                offset: Offset(0, 0) // changes position of shadow
                ),
          ],
        ),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(10),
            ), // elevation: 3.0,
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                image:
                                    const AssetImage('assets/images/User.jpg'),
                              ))),
                      SizedBox(width: 20),
                      Text(
                        blogs[index]['Username'],
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          blogs[index]['Date_'],
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 5),
                horizontalLine(screenWidth / 2),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                      // padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: blogs[index]['Post'],
                        ),
                        readOnly: true,
                        keyboardType: TextInputType.multiline,
                      )),
                ),
                SizedBox(height: 15),
                horizontalLine(screenWidth / 2),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ButtonBar(
                        children: [
                          RatingBar.builder(
                            glowColor: Colors.amber,
                            initialRating: double.parse(blogs[index]['Rate']),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
