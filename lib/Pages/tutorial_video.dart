// import 'dart:html';

import 'dart:convert';

import 'package:amber_erp/Pages/profit_report.dart';
import 'package:amber_erp/Pages/sales_report.dart';
import 'package:amber_erp/Pages/vedio_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialVideo extends StatefulWidget {
  const TutorialVideo({Key? key}) : super(key: key);

  @override
  _TutorialVideoState createState() => _TutorialVideoState();
}

class _TutorialVideoState extends State<TutorialVideo> {

  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("assets/vediogrid.json").then((value){
       setState(() {
         info =  json.decode(value);
       });

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Tutorial",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>const VideoHome());
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  "About Amber",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                const Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>const VideoHome());
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 255, 0.8),
                      Color.fromRGBO(65, 105,225, 0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 255, 0.3),
                    )
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next Session",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Let's Start with",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Amber erp software",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60Min",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(65, 105, 225, 0.8),
                                      blurRadius: 10,
                                      offset: Offset(4, 8))
                                ]),
                            child: const Icon(
                              Icons.play_circle_fill,
                              color: Colors.red,
                              size: 60,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          //  SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20),
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                     image: AssetImage("assets/erpsoftware.jfif"),
                    fit: BoxFit.fill,
                      ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 40,
                    offset: Offset(8,10),
                    color: Color.fromRGBO(234, 221, 202, 0.3),


                  ),
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(-1,-5),
                  color: Color.fromRGBO(234, 221, 202, 0.3),
              )
                ]
              ),
            ),
            Row(
              children: const [
                Text("Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                )
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context:context,
                child: ListView.builder(
                  itemCount: info.length.toDouble()~/2,
                    itemBuilder: (_,i){
                    int a = 2*i;
                    int b = 2*i+1;
                    print(info);
                    var element =  info.elementAt(i);
                    print(element);
                    return GestureDetector(onTap: (){
                      print(element['title']);
                      if(element['title']=='Tutorials') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SalesReport()));
                      }
                      if(element['title']=='New Feature') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfitReport()));
                      }

                    },
                    child: Row(
                        //return Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 170,
                          margin:const EdgeInsets.only(left:30,bottom:15,top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(info[a]['img']),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5,5),
                                color: Color.fromRGBO(65, 105, 225, 0.1)
                              ),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5,-5),
                                  color: Color.fromRGBO(65, 105, 225, 0.1)
                              )
                            ]
                          ),
                          child: Center(
                            child: Align(alignment:Alignment.bottomCenter,child: Text(info[a]['title'],style: const TextStyle(fontSize: 20,color: Colors.red),)),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 170,
                          margin:const EdgeInsets.only(left:30,bottom:15,top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[b]['img']),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5,5),
                                    color: Color.fromRGBO(65, 105, 225, 0.1)
                                ),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5,-5),
                                    color: Color.fromRGBO(65, 105, 225, 0.1)
                                )
                              ]
                          ),
                          child: Center(
                            child: Align(alignment:Alignment.bottomCenter,child: Text(info[b]['title'],style: const TextStyle(fontSize: 20,color: Colors.red),)),
                          ),
                        )
                      ],
                      ),
                      );
                    }),
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
