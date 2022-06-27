import 'package:amber_erp/Pages/home_page.dart';
import 'package:amber_erp/SideBar/side_bar.dart';
import 'package:flutter/material.dart';

class MySidebarLayout extends StatelessWidget {
  const MySidebarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  <Widget>[

          HomePage(),
          MySideBar(),
        ],
      )
      );

  }
}
