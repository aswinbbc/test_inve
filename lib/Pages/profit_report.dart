import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class ProfitReport extends StatefulWidget {

  const ProfitReport({Key? key}) : super(key: key);

  @override
  _ProfitReportState createState() => _ProfitReportState();
}

class _ProfitReportState extends State<ProfitReport> {
  List<dynamic> Report =  [];
  Future<List> getProfit() async{
    DateTime today = DateTime.now();
    ProfitMaster().profitreport(today).then((value){
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
          mytitle: "Profit Report",
        ),
      ),
      body: FutureBuilder(
        future: getProfit(),
        builder: (BuildContext context,
            AsyncSnapshot<List>snapshot){
          if(snapshot.hasData)
            {
               return ListView.builder(itemBuilder: (BuildContext,index){
                 var element = Report.elementAt(index);
                 //print(element['salesdate']);
                 return Card(
                   child: ListTile(
                     leading: CircleAvatar(child: Text(element['profitamount']),radius: 30,),
                     title: Text(element['salesamount'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.green),),
                     subtitle: Text(element['costamount'],style: const TextStyle(color: Colors.red),),
                     trailing: Text(element['salesdate']),
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
