import 'package:flutter/material.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/blog/components/body.dart';

class WithdrawTable extends StatelessWidget {
  const WithdrawTable({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection:
                screenwidth < 950 ? Axis.horizontal : Axis.vertical,
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: auth.get_requ(),
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
                    return DataTable(
                      dataRowColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected))
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08);
                        return Colors.green.shade300;
                      }),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(Languages.of(context)!.date),
                        ),
                        DataColumn(
                          label: Text(
                            Languages.of(context)!.amount,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            Languages.of(context)!.address,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            Languages.of(context)!.status,
                          ),
                        ),
                      ],
                      rows: List.generate(
                          snapshot.data.length,
                          (index) => DataRow(
                                selected: true,
                                cells: <DataCell>[
                                  DataCell(Text(snapshot.data[index]['Date_'])),
                                  DataCell(
                                      Text(snapshot.data[index]['Amount'])),
                                  DataCell(
                                      Text(snapshot.data[index]['Address'])),
                                  DataCell(
                                      Text(snapshot.data[index]['Statue'])),
                                ],
                              )),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
