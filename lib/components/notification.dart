import 'package:amber_erp/Pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  _MyNotificationState createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  final int _counter =6;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: (){
          Get.to(()=>NotificationPage());
        },
        child: SizedBox(
          width: 30,
          height: 30,
          child: Stack(
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 5),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        _counter.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
