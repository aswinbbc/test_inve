import 'package:amber_erp/Pages/sign_up.dart';
import 'package:amber_erp/Pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const SAVE_KEY_NAME = 'UserLogedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.blue),

      routes: {
        "signup": (context) => const Sign_up(),
      },

      debugShowCheckedModeBanner: false,

      //home: Sign_up(),
      // home: Login_page(),
      // home: HomePage(),
      // home: MySidebarLayout(),
      //home: MyDashBord(),
      //home: CategoryViewChart(),
      // home: MyListViewDashbord(),
      //home: Home_Screen(),
      //home: MonthlyDashBord(),
      //home: SalesReport(),
      //home: PurchaseReport(),
      //home: CashSummary(),
      // home: ProfitReport(),
      //home: QuotationReport(),
      home: const SplashScreen(),
      // home: TutorialVideo(),
      //home: VideoHome(),
      //home: WatsNewPage(),
      //home: SupportPage(),
      // home: SearchPage(),
      // home: ProductSearch(),
      // home: NotificationPage(),
      //home: MailPage(),
      // home: SettingsPage(),
      // home: PasswordChange(),
      //home: ClientList(),
      //home: SummaryReport(),
      // home: SupplierSummary(),
      //home: CustomerSummary(),
      // home: CommonReports(),
      //home: PosReconcilation(),
      // home: Vouchers(),
      // home: ListviewControll(),
    );
  }
}
