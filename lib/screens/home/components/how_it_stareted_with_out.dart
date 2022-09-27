import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/components/how_it_started_image.dart';
import 'package:mining_sett/screens/home/components/how_it_started_image_mobile.dart';

class HowItStartedSectionWithOutPointer extends StatelessWidget {
  const HowItStartedSectionWithOutPointer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Container(
      // height: 550,
      width: size - 150,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          size > 900 ? const TextTitle() : const TextTitleMobile(),
          const SizedBox(
            height: 70,
          ),
          size < 1000
              ? const ImagesHowiStartweb()
              : const ImagesHowiStartMobile(),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Languages.of(context)!.howDoStarted,
      style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}

class TextTitleMobile extends StatelessWidget {
  const TextTitleMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Languages.of(context)!.howDoStarted,
      style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}

class ImagesHowiStartweb extends StatelessWidget {
  const ImagesHowiStartweb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HowItStartedImageMobile(
            image: 'assets/images/Login.gif',
            tilte: Languages.of(context)!.howDoOnetitle,
            titledec: Languages.of(context)!.howDoOnedes),
        HowItStartedImageMobile(
          image: 'assets/images/cloud2.gif',
          tilte: Languages.of(context)!.howDoTowtitle,
          titledec: Languages.of(context)!.howDoTowdes,
        ),
        HowItStartedImageMobile(
          image: 'assets/images/Mony.gif',
          tilte: Languages.of(context)!.howDoThreetitle,
          titledec: Languages.of(context)!.howDoThreedes,
        ),
      ],
    );
  }
}

class ImagesHowiStartMobile extends StatelessWidget {
  const ImagesHowiStartMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HowItStartedImage(
          image: 'assets/images/Login.gif',
          tilte: Languages.of(context)!.howDoOnetitle,
          titledec: Languages.of(context)!.howDoOnedes,
        ),
        HowItStartedImage(
          image: 'assets/images/cloud2.gif',
          tilte: Languages.of(context)!.howDoTowtitle,
          titledec: Languages.of(context)!.howDoTowdes,
        ),
        HowItStartedImage(
          image: 'assets/images/Mony.gif',
          tilte: Languages.of(context)!.howDoThreetitle,
          titledec: Languages.of(context)!.howDoThreedes,
        ),
      ],
    );
  }
}
