import 'package:flutter/material.dart';
import 'package:mining_sett/localization/language/languages.dart';

class StatisticsTable extends StatelessWidget {
  const StatisticsTable({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    String? date = Languages.of(context)!.incomeStatistics;
    return Container(
      height: 400,
      width: screenwidth < 950 ? screenwidth - 50 : screenwidth / 1.7,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: 2,
                blurRadius: 9,
                offset: Offset(-2, 3) // changes position of shadow
                ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(screenwidth < 950 ? 0 : 8.0),
        child: Padding(
          padding: EdgeInsets.all(screenwidth < 950 ? 0 : 8.0),
          child: SingleChildScrollView(
            scrollDirection:
                screenwidth > 900 ? Axis.vertical : Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                dataRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  return Colors.grey.shade300;
                }),
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      Languages.of(context)!.date,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'GH/S',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      Languages.of(context)!.decription,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      Languages.of(context)!.amount,
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Mohit')),
                      DataCell(Text('23')),
                      DataCell(Text('Professional')),
                      DataCell(Text('Professional')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
