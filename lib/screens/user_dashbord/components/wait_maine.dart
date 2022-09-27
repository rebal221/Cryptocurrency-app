import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/payapi.dart';
import 'package:url_launcher/url_launcher.dart';

class WaitMiner extends StatefulWidget {
  const WaitMiner({
    Key? key,
    required this.pay_Id,
  }) : super(key: key);
  final String pay_Id;

  @override
  State<WaitMiner> createState() => _WaitMinerState();
}

class _WaitMinerState extends State<WaitMiner> {
  @override
  Widget build(BuildContext context) {
    PayApi auth = PayApi();
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenwidth < 850 ? screenwidth / 3.5 : 200,
        height: screenwidth < 850 ? screenwidth / 3.5 : 200,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.of(context).size.width / 9
                  : MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.of(context).size.width / 9
                  : MediaQuery.of(context).size.width / 8,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/images/waitCoin.gif'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  auth.checkPay(widget.pay_Id).then((val) {
                    if (val != 'faild') {
                      String _URI = val.toString();
                      launch('$_URI');
                    } else if (val == 'ok') {
                      setState(() {});
                    }
                  });
                },
                child: Center(
                    child: Text('update your batch',
                        style: GoogleFonts.lato(fontSize: 10)))),
            Container(
              height: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.of(context).size.width / 9
                  : MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.of(context).size.width / 9
                  : MediaQuery.of(context).size.width / 8,
              child: IconButton(
                  icon: Image.asset('assets/images/refresh.gif'),
                  onPressed: () {
                    auth.checkPay(widget.pay_Id).then((val) {
                      if (val != 'faild') {
                        String _URI = val.toString();
                        launch('$_URI');
                      } else if (val == 'ok') {
                        setState(() {});
                      }
                    });
                  }),
            ),
            SizedBox(height: 3),
          ],
        ));
  }
}
