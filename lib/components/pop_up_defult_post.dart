import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/validator.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../constants.dart';

class PopUpDefultPost extends StatelessWidget {
  const PopUpDefultPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController postController = TextEditingController();
    double Rating = 0.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AlertDialog(
      content: Container(
        height: 300,
        child: Column(
          children: [
            Text(
              'Add Post',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            horizontalLine(
                screenWidth < 900 ? screenWidth - 40 : screenWidth / 4),
            SizedBox(height: 20),
            Container(
                width: screenWidth < 900 ? screenWidth - 40 : screenWidth / 4,
                // padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: postController,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'what are you thinking about ?',
                  ),
                  readOnly: false,
                  keyboardType: TextInputType.multiline,
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        Rating = rating;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();

            AuthProvider auth = AuthProvider();
            if (Validator().validatePost(postController.text) == '') {
              String post = postController.text;
              if (Rating != 0) {
                String rate = Rating.toString();

                String userName = prefs.getString('Name').toString();

                auth.addpost(userName, post, rate);
                showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                    message:
                        "Your post has been sent \nand waiting for publeshing",
                  ),
                );
                Navigator.pop(context, 'Cancel');
              } else {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message:
                        "Rateing must be entered.\n Please check and try again",
                  ),
                );
              }
            } else {
              showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message: "Post must be entered.\n Please check and try again",
                ),
              );
            }
          },
          child: const Text('Post'),
        ),
      ],
    );
  }
}

class genBill extends StatefulWidget {
  const genBill({Key? key}) : super(key: key);

  @override
  _genBillState createState() => _genBillState();
}

class _genBillState extends State<genBill> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
