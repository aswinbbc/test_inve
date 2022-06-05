import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/salesreport_model.dart';
import 'package:flutter/material.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  Future<List<report>> getData() async {
    DateTime today = DateTime.now();
    List value = await getSalesReport(today);

    List<report> widList = value
        .map((element) => report(
            clientName: element['CustomerName'],
            salesAmount: int.parse(element['SaleAmount']),
            paymentMode: element['PaymentMode']))
        .toList();

    return widList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarNormal(mytitle: "Sales Report"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<report>> snapshot) {
            if (snapshot.hasData) {
              final reportList = snapshot.data;
              return DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text("ClientName")),
                  DataColumn(label: Text("SaleAmount")),
                  DataColumn(label: Text("PaymentMode")),
                ],
                rows: reportList!.map((element) => DataRow(
                  cells: [
                    DataCell(Text(element.clientName)),
                    DataCell(Center(child:Text(element.salesAmount.toString()))),
                    DataCell(Center(child:Text(element.paymentMode))),
                  ],
                ),).toList(),
              );
              return const Text("data found");
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("no data found"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
