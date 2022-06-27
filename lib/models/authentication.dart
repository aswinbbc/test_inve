//import 'dart:convert';
//import 'dart:js';
//import 'dart:js';
import 'package:amber_erp/Pages/client_list.dart';
import 'network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

//String Url = "http://192.168.43.92:8080";
//String Url = "http://192.168.8.109:8080/Amber/";
//String Url = "http://192.168.8.114:8080";
//String Url = "http://10.0.2.2:8080";
String Url = "http://43.204.201.83/api/";

class UserAuth {
  String data = "data";

  login(params) async {
    var data = await getData("${Url}registration.php", params: params);
    print(data);
    if (data == 'Welcome,Registration Successfull') {}
    return data;
  }
}

class UserLogin {
  Future<String> login(
      String? username, String? pass, String fingerprint) async {
    // var data = await getData("http://10.0.2.2:8080/Amber/login.php",params:{'uname':username,'pass':pass});
    var data = await getData("${Url}login.php", params: {
      'uname': username,
      'pass': pass,
      'fingerprint': fingerprint,
    });
    //print('gggggggyyyyyyyyy$data');
    List<dynamic> Report = [];
    Report = data['clientId'];
    var action = Report.elementAt(0);
    if (action['Is_Active'] != '0') {
      if (Report.length > 1) {
        //print(Report.length);
        // print(Report);
        data['message'] = "multi client";
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_name', (data['username']).toString());
        await prefs.setString('pass_word', (data['password']).toString());
        //await prefs.setString('shop_name', (Report['clientName']).toString());
        Get.to(() => ClientList(
              businessList: Report,
            ));
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientList()));
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<dynamic> ReportData = [];
        ReportData = data['clientId'];
        var element = ReportData.elementAt(0);
        //print(element['Is_Active']);
        if (data['message'] == 'User Successfully LoggedIn') {
          await prefs.setString('user_id', (data['id']).toString());
          await prefs.setString('client_id', (element['clientId']));
          await prefs.setString('user_name', (data['username']).toString());
          await prefs.setString('shop_name', (data['shopname']).toString());
          // await prefs.setStringList('client_id', (data['clientId']));
          // final List<String>? items = prefs.getStringList('client_id');
        }
      }
      // print(data['message']);
      return data['message'];
    } else {
      data['message'] = "Waiting for Authentication";
      return data['message'];
    }
  }
}

class DashToday {
  Future<Map> todayreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'todaylist': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}TodayDashbord.php", params: params);
    //var data = await getData("$Url/Amber/TodayDashbord.php",params:params);
    // var data = await getData("http://10.0.2.2:8080/Amber/TodayDashbord.php",params:params);
    // print(data);

    // if(jsonData['id'] > 0) {

    // }
    return data;
  }
}

class DashWeekList {
  weekreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'todaylist': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}ListviewDashbord.php", params: params);
    //print("wekreporttttt = $data");
    return data;
  }
}

class DashMonthlyList {
  monthlyreport(DateTime year) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(year);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentyear': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}MonthlyDashbord.php", params: params);
    print("wekreport = $data");
    return data;
  }
}

class SalesReportMaster {
  salesreportdetail(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}SalesReport.php", params: params);
    // print("wekreport = ${data.length}");
    return data;
  }
}

class PurchaseReportMaster {
  purchasereportdetail(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}PurchaseReport.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class SummaryMaster {
  cashsummary(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    List data = await getData("${Url}CashSummaryMaster.php", params: params);
    // print("summary report = ${data.length}");
    return data;
  }
}

class ProfitMaster {
  profitreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}ProfitReport.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class QuotationMaster {
  qtnreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    // print(clientId);
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}QuotationReport.php", params: params);
    // print("wekreport = $data");
    return data;
  }
}

class CategoryMaster {
  categoryprofit(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}CategoryProfit.php", params: params);
    // print("wekreport = $data");
    return data;
  }
}

class StockReportMaster {
  stockreportdetails(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}StockReport.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class PurchaseComparisonMaster {
  comparisonreport(DateTime year) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(year);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentyear': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}PurchaseComparison.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class SalesorderMaster {
  salesorderreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}SalesOrderReport.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class ChequeMasterReceived {
  chequereceived(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    // print(params);
    var data =
        await getData("${Url}ChequeNotificationReceived.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

//   class VideoMaster{
//
//
//
//   videodetails() async{
//   var data = await getData("http://10.0.2.2:8080/Amber/TutorialVideo.php");
//   print("wekreport = $data");
//   return data;
//   }
//
//
// }
class WatsnewMaster {
  watsnewdetails() async {
    var data = await getData("${Url}Wats_new.php");

    return data;
  }
}

class CustumNotification {
  notificationdetails() async {
    var data = await getData("${Url}notification_view.php");

    return data;
  }
}

class ChangePassword {
  Future<String> editPassword(String? email, String? pass) async {
    // var data = await getData("http://10.0.2.2:8080/Amber/login.php",params:{'uname':username,'pass':pass});
    var data = await getData("${Url}changepassword.php",
        params: {'email': email, 'pass': pass});

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (data['message'] == 'Password has been updated') {
      await prefs.setString('user_id', (data['id']).toString());
      await prefs.setString('user_name', (data['username']).toString());
      await prefs.setString('shop_name', (data['shopname']).toString());
    }
    return data['message'];
  }
}

class ClientSummary {
  clientreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}CustomerSummary.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class SupplierSummaryReport {
  supplierreport(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    // print(params);
    var data = await getData("${Url}SupplierSummary.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class PosReconMaster {
  reconcilationdetails(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data = await getData("${Url}PosReconcilation.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}

class AccountsVoucher {
  accountsdetails(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    // print(params);
    var data = await getData("${Url}AccountsVoucher.php", params: params);
    // print("acoounts = $data");
    return data;
  }
}

class AccountsVoucherSummary {
  vouchersummary(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    //print(params);
    var data =
        await getData("${Url}AccountsVoucherSummary.php", params: params);
    print("cvoucher sum = $data");
    return data;
  }
}

class LpoPendingMaster {
  lpopending(DateTime today) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(today);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('client_id').toString();
    final params = {'currentdate': formatted, 'clientId': clientId};
    print(params);
    var data = await getData("${Url}LpoPendingReport.php", params: params);
    //print("wekreport = $data");
    return data;
  }
}
