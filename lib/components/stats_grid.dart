import 'package:amber_erp/models/authentication.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  const StatsGrid({Key? key}) : super(key: key);

  @override
  State<StatsGrid> createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  double salesAmount = 0;

  double salereturn = 0;

  double cash = 0;

  double card = 0;

  double countcustomer = 0;

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    var now = DateTime.now();
    DashToday().todayreport(now).then((value) {
      print(value);
      var element = value;

      setState(() {
        double name = double.parse(element['id']);
        String todayDate = element['date'];
        salesAmount = double.parse(element['saleamount']);
        salereturn = double.parse(element['returnamount']);

        cash = double.parse(element['cashamount']);
        card = double.parse(element['cardamount']);
        countcustomer = double.parse(element['customercount']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildStartCard('TotalSales', salesAmount,
                  isIconEnabled: true, icon: Icons.shopping_cart),
              _buildStartCard('TotalReturn', salereturn,
                  isIconEnabled: true, icon: Icons.numbers)
            ],
          )),
          Row(
            children: <Widget>[
              _buildStartCard(
                'Cash',
                cash,
              ),
              _buildStartCard(
                'Count',
                countcustomer,
              ),
              _buildStartCard(
                'Card',
                card,
              ),
            ],
          )
        ],
      ),
    );
  }

  Expanded _buildStartCard(String title, double count,
      {bool isIconEnabled = false, IconData icon = Icons.circle}) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: EdgeInsets.only(
              bottom: isIconEnabled ? 10.0 : 5.0, left: 8, top: 5),
          decoration: BoxDecoration(
            color: const Color(0x00ffffff),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isIconEnabled)
                    Icon(
                      icon,
                      size: 50,
                      color: Colors.blue,
                    ),
                  Expanded(
                    child: Text(
                      count.toString(),
                      style: Theme.of(context).textTheme.titleLarge!,
                      textAlign:
                          isIconEnabled ? TextAlign.center : TextAlign.left,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
