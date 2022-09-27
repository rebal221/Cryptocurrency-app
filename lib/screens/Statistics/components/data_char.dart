import 'package:flutter/material.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataChartFor7Days extends StatelessWidget {
  const DataChartFor7Days({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    double a = 0.0;
    return FutureBuilder(
      future: auth.get_Statistics(),
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
          return Container(
              width: screenwidth / 1.7,
              child: SfCartesianChart(
                  // title: ChartTitle(text: 'Half yearly sales analysis'),
                  // Enable legend
                  // legend: Legend(isVisible: true),W
                  // Enable tooltip
                  // tooltipBehavior: _tooltipBehavior,
                  // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    // Initialize line series
                    LineSeries<SalesData, String>(
                        dataSource: List.generate(
                            snapshot.data['dates'].length,
                            (index) => SalesData(
                                snapshot.data['dates'][index].toString(),
                                a += double.parse(
                                    snapshot.data['price'].toString()))),
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales)
                  ]));
        }
      },
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double? sales;
}
