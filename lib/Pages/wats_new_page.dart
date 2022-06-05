//import 'dart:html';

import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class WatsNewPage extends StatefulWidget {
  const WatsNewPage({Key? key}) : super(key: key);

  @override
  _WatsNewPageState createState() => _WatsNewPageState();
}

class _WatsNewPageState extends State<WatsNewPage> {
  List<dynamic> Report = [];
  Future<List> getWatsNew() async {
   // DateTime today = DateTime.now();
    WatsnewMaster().watsnewdetails().then((value) {
      List<dynamic> list = (value as List).reversed.toList();

      setState(() {
        Report = list;
      });
    });
    return Report;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wat's New"),
      ),
      body: FutureBuilder(
        future: getWatsNew(),
    builder: (BuildContext context,
    AsyncSnapshot<List>snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: Report.length,
          itemBuilder: (context, index) {
            var element = Report.elementAt(index);
            return GestureDetector(
              onTap: () {
                showDialogFunc(context,element['title'],element['subTitle']);
              },
              child: Card(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset("assets/AMBER.ico"),
                      ),
                      const Padding(padding: EdgeInsets.all(10.0)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            element['title'],
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              element['subTitle'],
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            );
          },);
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

showDialogFunc(context,title,subtitle){
  return showDialog(context: context, builder: (context){
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width*0.7,
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset("assets/AMBER.ico",width: 200,height: 200,),
              ),
              const SizedBox(height: 10,),
              Text(title,style: const TextStyle(fontSize: 25,color: Colors.grey,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text(subtitle,style: TextStyle(fontSize: 15,color: Colors.grey[500],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

            ],
          ),
        ),
      )

    );
  });
}
