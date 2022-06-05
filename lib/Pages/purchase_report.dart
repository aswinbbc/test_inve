import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/purchasereport_model.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseReport extends StatefulWidget {
  const PurchaseReport({Key? key}) : super(key: key);


  @override
  _PurchaseReportState createState() => _PurchaseReportState();
}

class _PurchaseReportState extends State<PurchaseReport> {
  Future<List<purchasereport>>getData()async{
    DateTime today = DateTime.now();
    List value =await getPurchasereport(today);

    List<purchasereport> widList =value
    .map((element) => purchasereport(
        supplierName: element['SupplierName'],
        purchaseAmount: int.parse(element['PurchaseAmount']),
        paymentMode: element['PaymentMode'],
       invoiceNo: element['InvoiceNo'])).toList();

    return widList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarNormal(mytitle: "PurchaseReport",),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<purchasereport>> snapshot) {
            if (snapshot.hasData) {
              final reportList = snapshot.data;

              return SingleChildScrollView(scrollDirection: Axis.horizontal,

                child: SingleChildScrollView(scrollDirection: Axis.vertical,
                  child: DataTable(dividerThickness: 5,dataRowHeight: 50,columnSpacing: 10,
                    showBottomBorder: true,
                    headingTextStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                    columns: const <DataColumn>[
                      DataColumn(label: Text("supplierName")),
                      DataColumn(label: Text("Amount")),
                      DataColumn(label: Text("paymentMode")),
                      DataColumn(label: Text("Invoice No")),
                    ],
                    rows: reportList!.map((element) => DataRow(
                      cells: [
                        DataCell(Text(element.supplierName.length > 20 ? element.supplierName.substring(0,10)+'..':element.supplierName,)),
                        DataCell(Center(child:Text(element.purchaseAmount.toString()))),
                        DataCell(Text(element.paymentMode)),
                        DataCell(Text(element.invoiceNo)),
                      ],
                    ),).toList(),
                  ),
                ),
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
