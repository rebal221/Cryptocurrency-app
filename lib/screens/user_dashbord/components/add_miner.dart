import 'package:flutter/material.dart';
import 'package:mining_sett/components/pop_up_defult_mobile.dart';

class AddMiners extends StatelessWidget {
  const AddMiners({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => PopUpDefultMobile(),
          );
        },
        child: Container(
          width: screenwidth < 850 ? screenwidth / 4 : 200,
          height: screenwidth < 850 ? screenwidth / 4 : 200,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/images/plus.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
