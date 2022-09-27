import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mining_sett/components/app_url.dart';

import 'dart:convert';

Future get_Blogs() async {}

class PayApi extends ChangeNotifier {
  Future getStatu() async {
    var request =
        http.Request('GET', Uri.parse('https://api.nowpayments.io/v1/status'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future getCorrenci() async {
    var headers = {'x-api-key': 'H3B10S4-SVY4ZMS-PYQH8XH-KDSW8GY'};
    var request = http.Request(
        'GET', Uri.parse('https://api.nowpayments.io/v1/currencies'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future getPrice() async {
    var headers = {'x-api-key': 'H3B10S4-SVY4ZMS-PYQH8XH-KDSW8GY'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.nowpayments.io/v1/estimate?amount=3999.5000&currency_from=usd&currency_to=btc'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future createPayment(String id, String price, String hash) async {
    var url = Uri.parse(AppUrl.createPayment);
    var resault;
    http.Response response = await http
        .post(url, body: {'User_Id': id, 'Price': price, 'Hash_Rate': hash});
    var data = jsonDecode(response.body);
    if (data['status'] != null)
      return "false";
    else
      return data['invoice_url'];
  }

  Future checkPay(String id) async {
    var url = Uri.parse(AppUrl.checkPay);
    http.Response response = await http.post(url, body: {'id': id});
    var data = jsonDecode(response.body);

    return data;
  }
}
