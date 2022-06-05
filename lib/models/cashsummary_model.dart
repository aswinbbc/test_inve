import 'package:amber_erp/models/authentication.dart';

class summaryreport{
  final DateTime date;
  final int salesAmount;
  final int salesReturn;
  final int purchaseAmount;
  final int purchaseReturn;
  final int receivables;
  final int payables;
  final int otherIncome;
  final int otherExpense;

  const summaryreport({
    required this.date,
    required this.salesAmount,
    required this.salesReturn,
    required this.purchaseAmount,
    required this.purchaseReturn,
    required this.receivables,
    required this.payables,
    required this.otherIncome,
    required this.otherExpense,
}

      );
}

Future<List>cashSummaryReport(DateTime today) async{
  List<dynamic>list=(await SummaryMaster().cashsummary(today) as List).reversed.toList();
  return list;
}