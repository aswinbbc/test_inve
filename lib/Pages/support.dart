import 'package:amber_erp/components/project_numbers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final double coverHeight=280;
  final double profileHeight=144;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(title: Text("Support"),),
       body:ListView(
         padding: EdgeInsets.zero,
           children: <Widget>[
             buildTop(),
             buildContent(),
           ],

       ),
    );
  }
 Widget buildTop() {
   final top = coverHeight - profileHeight /2;
   final bottom = profileHeight / 2;
  return Stack(
     clipBehavior: Clip.none,
     alignment: Alignment.center,
     children: [
       Container(
         margin: EdgeInsets.only(bottom: bottom),
           child: buildCoverImage()),
       Positioned(
           top: top,
           child: buildProfileImage()),

     ],

   );

 }

 Widget buildContent()=>Column(
   children: [
     const SizedBox(height: 8,),
     const Text("AMBER",
       style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),
     ),
  const SizedBox(height: 8,),
  const Text("erp software",
  style: TextStyle(fontSize: 20,color: Colors.black45),),
     const SizedBox(height: 16,),
     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
            buildSocialIcon(FontAwesomeIcons.facebook),
            const SizedBox(width: 12,),
            buildSocialIcon(FontAwesomeIcons.youtube),
            const SizedBox(width: 12,),
            buildSocialIcon(FontAwesomeIcons.twitter),
            const SizedBox(width: 12,),
            buildSocialIcon(FontAwesomeIcons.instagram)
       ],
     ),
     const SizedBox(height: 16,),
     const Divider(),
     const SizedBox(height: 16,),
     const ProjectNumbers(),
     const SizedBox(height: 16,),
     const Divider(),
     const SizedBox(height: 16,),
     buildAbout(),

   ],
 );

  Widget buildSocialIcon(IconData icon)=>CircleAvatar(
    radius: 25,
    child: Material(
      shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: (){},
            child: Center(child: Icon(icon,size: 32,),))),
  );

  Widget buildAbout()=>Container(
    padding: const EdgeInsets.symmetric(horizontal: 34),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("About us",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),),
      const SizedBox(height: 16,),
      const Text("Amber is complete business managment interface that efficently manages a company's Inventory,Finance"
          "and payroll system in easist and the simplest way. it is complete business managment software that"
          "enables efficient managment of company's inventories and finance system.",
        style: TextStyle(fontSize: 18,height: 1.4),
      ),
      const SizedBox(height: 20,),
      const Text("For sales",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      const SizedBox(height: 16,),
      salesContainer(),
      const SizedBox(height: 16,),
      const Text("For support",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      const SizedBox(height: 16,),
      supportContainer(),
    ],
  ),



  );

  Widget salesContainer()=>   SizedBox(
    width: 400,
    height: 100,
    child: Card(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  const Icon(Icons.phone,color: Colors.green,),
                  Expanded(child: Container()),
                  const Text("30611913 / 77013425"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  const Icon(Icons.mail,color: Colors.green,),
                  Expanded(child: Container()),
                  const Text("info@amalgamatetechnologies.com"),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

  Widget supportContainer()=>  SizedBox(
    width: 400,
    height: 100,
    child: Card(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  const Icon(Icons.phone,color: Colors.red,),
                  Expanded(child: Container()),
                  const Text("30032216 / 30032217"),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  const Icon(Icons.mail,color: Colors.red,),
                  Expanded(child: Container()),
                  const Text("support@amalgamatetechnologies.com")
                ],
              ),
            )
          ],
        ),
      ),
    ),

  );

  Widget buildCoverImage()=>Container(
    color: Colors.grey,
    child: Image.asset("assets/supportImage.jpg",
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage()=>CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.white,
    backgroundImage: const AssetImage("assets/AMBER.ico"),
  );
}
