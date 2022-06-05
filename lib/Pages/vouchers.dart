import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Vouchers extends StatefulWidget {
  const Vouchers({Key? key}) : super(key: key);

  @override
  State<Vouchers> createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
double pv=0;
double rv=0;
double sc=0;
double pc=0;
final String? vouchertype='SC';
  List<dynamic> Report =  [];
  Future<List> getVoucherSummary() async{
    DateTime today = DateTime.now();
    AccountsVoucherSummary().vouchersummary(today).then((value){
     // List<dynamic>list = (value as List).reversed.toList();
      var element = value;
      //print("eeeee$element");
      setState(() {
        if(vouchertype==element['PV']){
          pv=double.parse(element['voucherAmount']);
        }
        else if(vouchertype=='PC'){
          pc=double.parse(element['voucherAmount']);
        }
        else if(vouchertype=='RV'){
          rv=double.parse(element['voucherAmount']);
        }
        else if(vouchertype==element['SC']){
          sc=double.parse(element['voucherAmount']);
          print("koiiiiiiii$sc");
        }

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
          mytitle: "Voucher Report",
        ),
      ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
       future: getVoucherSummary(),
    builder: (BuildContext context,
    AsyncSnapshot<List>snapshot){
    //if(snapshot.hasData){

    return  ListView(
      children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
          height: 120.0,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
          items: [

        Card(elevation: 5,
          child: Container(
              decoration: BoxDecoration(color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('Total Paid'),
                        SizedBox(width: 110,),
                        Text('Payment Voucher',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontStyle: FontStyle.italic),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        const Image(image: AssetImage("assets/cashOutIcon.jpg"),height: 30,width: 30,),
                        const SizedBox(width: 10,),
                        Text(pv.toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),),
                      ],
                    ),

                  ),
                  const Text('Last Updated at :',style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black,fontStyle: FontStyle.italic),),
                ],
              ),
            ),
        ),
            Card(elevation: 5,
              child: Container(
                decoration: BoxDecoration(color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                width: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flexible(
                        child: Row(
                          children: const [
                            Text('Total Receipt'),
                            SizedBox(width: 90,),
                            Text('Receipt Voucher',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontStyle: FontStyle.italic),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          const Image(image: AssetImage("assets/cashInIcon.png"),height: 30,width: 30,),
                          const SizedBox(width: 10,),
                          Text(rv.toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 20),),
                        ],
                      ),

                    ),
                    const Text('Last Updated at :',style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black,fontStyle: FontStyle.italic),),
                  ],
                ),
              ),
            ),
            Card(elevation: 5,
              child: Container(
                decoration: BoxDecoration(color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                width: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flexible(
                        child: Row(
                          children: const [
                            Text('Total Receipt'),
                            SizedBox(width: 90,),
                            Text('Sales Voucher',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontStyle: FontStyle.italic),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          const Image(image: AssetImage("assets/cashInIcon.png"),height: 30,width: 30,),
                          const SizedBox(width: 10,),
                          Text(sc.toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 20),),
                        ],
                      ),

                    ),
                    const Text('Last Updated at :',style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black,fontStyle: FontStyle.italic),),
                  ],
                ),
              ),
            ),
            Card(elevation: 5,
              child: Container(
                decoration: BoxDecoration(color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                width: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text('Total Paid'),
                          SizedBox(width: 110,),
                          Text('Credit purchase',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontStyle: FontStyle.italic),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          const Image(image: AssetImage("assets/cashOutIcon.jpg"),height: 30,width: 30,),
                          const SizedBox(width: 10,),
                          Text(pc.toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),),
                        ],
                      ),

                    ),
                    const Text('Last Updated at :',style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black,fontStyle: FontStyle.italic),),
                  ],
                ),
              ),
            ),
        ],
      ),
       Padding(
         padding: const EdgeInsets.only(left: 10,top: 20),
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: const [
             Text("Details",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: Colors.blue),),

           ],
         ),
       ),
         const Expanded(child: ListviewControll()),

      ],


    );



      // }
      // else if (snapshot.hasError) {
      // return Center(
      // child: Text("no data found"),
      // );
      // } else {
      // return Center(child: CircularProgressIndicator());
      // }
    }
        ),
    );
  }
}

class ListviewControll extends StatefulWidget {
  const ListviewControll({Key? key}) : super(key: key);

  @override
  _ListviewControllState createState() => _ListviewControllState();
}

class _ListviewControllState extends State<ListviewControll> {

  List<dynamic> Report =  [];
  Future<List> getVoucherDetails() async{
    DateTime today = DateTime.now();
    AccountsVoucher().accountsdetails(today).then((value){
      List<dynamic>list = (value as List).reversed.toList();
      setState(() {
        Report = list;
       // print("vvvvvv");
      });

    });
    return Report;
  }
  //List<dynamic> Report =  [];

// @override
//   void initState() {
//   DateTime today = DateTime.now();
//   AccountsVoucher().accountsdetails(today).then((value){
//     List<dynamic>list = (value as List).reversed.toList();
// print("hello");
//     setState(() {
//       Report = list;
//
//     });
//     print(Report);
//   });
//   }
  @override
  Widget build(BuildContext context) {


  return Column(
    children: [
      FutureBuilder(
            future: getVoucherDetails(),
        builder: (BuildContext context,
        AsyncSnapshot<List>snapshot){
        if(snapshot.hasData)
        {

        return ListView.builder(itemBuilder: (BuildContext,index){
        var element = Report.elementAt(index);
        //print(element);
        //var type= element['voucherType'];
        return Card(
        child: ListTile(tileColor: Colors.white60,
        leading: ClipRRect(borderRadius:BorderRadius.circular(30),child: const Image(image: AssetImage("assets/voucherMoney.png"),)),
        title: Text(element['clientName'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
        subtitle: Row(
          children: [
            const Text('VoucherNo:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
            Text(element['voucherNo'],style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
          ],
        ),
        trailing: Wrap(spacing:12,
        children:<Widget>[
        const Text('QR.',style: TextStyle(color: Colors.amber),),
        Text(element['voucherAmount'],style: const TextStyle(color: Colors.black),),
        ],),
        ),
        elevation: 1,
        );
        },
        itemCount: Report.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
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
    ],
  );
  }
}

