import 'dart:async';
import 'package:amber_erp/Pages/common_reports.dart';
import 'package:amber_erp/Pages/product_search.dart';
import 'package:amber_erp/Pages/tutorial_video.dart';
import 'package:amber_erp/Pages/wats_new_page.dart';
import 'package:amber_erp/SideBar/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySideBar extends StatefulWidget {


  const MySideBar({Key? key}) : super(key: key);

  @override
  State<MySideBar> createState() => _MySideBarState();
}

class _MySideBarState extends State<MySideBar> with SingleTickerProviderStateMixin<MySideBar> {
  late StreamController<bool> isSidebarOpenedStreamController;
  late final Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  late AnimationController _animationController;
  final _animatedDuration = const Duration(milliseconds: 500);
  String shop="";
  String user ="";
 // final bool isSidebarOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: _animatedDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    getUser().then((value){
      user = value;
    }
    );
    getShop().then((value){
      shop = value;
    }
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed()
  {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
    }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();


getUser()async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final userName = prefs.getString('user_name').toString();
  return userName;
}
  getShop()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final shopName = prefs.getString('shop_name').toString();
    return shopName;
  }


  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context,isSideBarOpenedAsync){

      return AnimatedPositioned(duration: _animatedDuration ,
          top: 0,
          bottom: 0,
          left:  isSideBarOpenedAsync.data! ? 0 : -screenwidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenwidth -35,
          child: Row(children: <Widget>[
            Expanded(child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xFF262AAA),

              child: Column(
                children: <Widget>[
                  const SizedBox(height: 100,),
                  ListTile(
                    title: Text(user,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),),
                    subtitle: InkWell(onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      var txtuser = prefs.getString('user_name').toString();
                      var txtPass = prefs.getString('pass_word').toString();
                      UserLogin().login(txtuser, txtPass);
                     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductSearch()));
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(shop,style: const TextStyle(color: Color(0xFF1BB5FD),fontSize: 20),),
                      ),
                    ),
                    leading: const CircleAvatar(
                      child: Icon(Icons.perm_identity,color: Colors.white,),
                      radius: 40,
                    ),
                  ),
                  Divider(
                    height: 64,
                    thickness: 0.5,
                    color: Colors.white.withOpacity(0.3),
                    indent: 32,
                    endIndent: 32,
                  ),
                  MyMenuItem(
                    icon: Icons.home,
                    title: "Wat's New",
                    onTap: (){
                      onIconPressed();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WatsNewPage()));

                    }),
                  MyMenuItem(
                      icon: Icons.home,
                      title: "Tutorial",
                      onTap: (){
                        onIconPressed();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TutorialVideo()));

                      }
                  ),
                  MyMenuItem(
                      icon: Icons.home,
                      title: "Price Checking",
                      onTap: (){
                        onIconPressed();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductSearch()));
                      }
                  ),
                  MyMenuItem(
                      icon: Icons.home,
                      title: "Branch Controll",
                      onTap: (){
                        onIconPressed();

                      }
                  ),
                  MyMenuItem(
                      icon: Icons.home,
                      title: "News",
                      onTap: (){
                        onIconPressed();

                      }
                  ),
                  MyMenuItem(
                      icon: Icons.home,
                      title: "Reports",
                      onTap: (){
                        onIconPressed();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CommonReports()));
                      }
                  ),
                  Divider(
                    height: 64,
                    thickness: 0.5,
                    color: Colors.white.withOpacity(0.3),
                    indent: 32,
                    endIndent: 32,
                  ),
                  MyMenuItem(
                      icon: Icons.exit_to_app,
                      title: "Exit",
                      onTap: (){
                        onIconPressed();

                      }
                  ),

                ],
              ),

            )),



            Align(alignment: const Alignment(0,-0.7),
              child: GestureDetector(
                onTap: (){
                  onIconPressed();
                },
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    color: const Color(0xFF262AAA),
                    alignment: Alignment.centerLeft,

                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: const Color(0xFF1BB5FD),
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),


          ],),
        );
      },

    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}


