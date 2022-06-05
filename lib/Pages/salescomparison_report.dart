import 'package:amber_erp/Pages/monthlyview_dashbord.dart';
import 'package:amber_erp/components/appbar_normal.dart';
import 'package:flutter/material.dart';

class SalesComparison extends StatefulWidget {
  const SalesComparison({Key? key}) : super(key: key);

  @override
  _SalesComparisonState createState() => _SalesComparisonState();
}

class _SalesComparisonState extends State<SalesComparison> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarNormal(mytitle: "Salescomparison Report",),
      ),
      body: const MonthlyDashBord(),
    );
  }
}
