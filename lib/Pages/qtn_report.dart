import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class QuotationReport extends StatefulWidget {
  const QuotationReport({Key? key}) : super(key: key);

  @override
  _QuotationReportState createState() => _QuotationReportState();
}

class _QuotationReportState extends State<QuotationReport> {

  List<dynamic> Report =  [];
  Future<List> getQuotation() async{
    DateTime today = DateTime.now();
    QuotationMaster().qtnreport(today).then((value){
      List<dynamic>list = (value as List).reversed.toList();

      setState(() {
        Report = list;
      });

    });
    return Report;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarNormal(
          mytitle: "Quotation Report",
        ),
      ),
      body: FutureBuilder(
          future: getQuotation(),
          builder: (BuildContext context,
              AsyncSnapshot<List>snapshot){
            if(snapshot.hasData)
            {
              return ListView.builder(itemBuilder: (BuildContext,index){
                var element = Report.elementAt(index);
                //print(element['salesdate']);
                return Card(
                  child: ListTile(tileColor: Colors.white60,
                    leading: ClipRRect(borderRadius:BorderRadius.circular(30),child: const Image(image: AssetImage("assets/quotationIcon.png"),)),
                    title: Text(element['clientName'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
                    subtitle: Row(
                      children: [
                        const Text('QR:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
                        Text(element['qtnAmount'],style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    trailing: Wrap(spacing:12,
                      children:<Widget>[
                    Text(element['qtnDate'],style: const TextStyle(color: Colors.amber),),
                        Text(element['qtnNo'],style: const TextStyle(color: Colors.black),),
                    ],),
                  ),
                  elevation: 5,
                );
              },
                itemCount: Report.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.vertical,

              );
            }
            else if (snapshot.hasError) {
              return const Center(
                child: Text("no data found"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),

    );
  }
}
