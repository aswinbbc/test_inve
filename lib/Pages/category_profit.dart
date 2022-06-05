import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class CategoryProfit extends StatefulWidget {
  const CategoryProfit({Key? key}) : super(key: key);

  @override
  _CategoryProfitState createState() => _CategoryProfitState();
}

class _CategoryProfitState extends State<CategoryProfit> {

  List<dynamic> Report =  [];
  Future<List> getCategoryProfit() async{
    DateTime today = DateTime.now();
    CategoryMaster().categoryprofit(today).then((value){
      List<dynamic>list = (value as List).reversed.toList();
//print(list);
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
          mytitle: "Categoryprofit Report",
        ),
      ),
      body: FutureBuilder(
          future: getCategoryProfit(),
          builder: (BuildContext context,
              AsyncSnapshot<List>snapshot){
            if(snapshot.hasData)
            {
              return ListView.builder(itemBuilder: (BuildContext,index){
                var element = Report.elementAt(index);
                //print(element['salesdate']);
                return Card(
                  child: ListTile(tileColor: Colors.amber,
                    leading: CircleAvatar(child: Text(element['catProfit']),radius: 30,),
                    title: Text(element['catName'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.green),),
                    subtitle: Text(element['catAmount'],style: const TextStyle(color: Colors.red),),
                    trailing: Wrap(spacing:12,
                        children:<Widget>[
                      const Text("Cost:"),
                        Text(element['catCost'],style: const TextStyle(color: Colors.white),)
                    ]),
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
