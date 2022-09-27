import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:line_icons/line_icons.dart';

class Defult_accordone extends StatelessWidget {
  const Defult_accordone({
    Key? key,
    required this.qusetion,
    required this.Answer,
  }) : super(key: key);
  final String qusetion;
  final String Answer;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      width: size / 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade700,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(-2, 3) // changes position of shadow
              ),
        ],
      ),
      child: GFAccordion(
          contentBorderRadius: BorderRadius.circular(10),
          title: qusetion,
          content: Answer,
          collapsedIcon: Icon(LineIcons.plus),
          expandedIcon: Icon(LineIcons.minus)),
    );
  }
}
