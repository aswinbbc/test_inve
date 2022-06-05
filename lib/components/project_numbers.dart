import 'package:flutter/material.dart';

class ProjectNumbers extends StatelessWidget {
  const ProjectNumbers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(text:'Products',value:5),
      buildDivider(),
      buildButton(text:'Clients',value:1034),
      buildDivider(),
      buildButton(text:'Service',value:18),
      buildDivider(),

    ],
  );

  Widget buildDivider()=>const SizedBox(
    height: 24,
    child: VerticalDivider(),
  );

  Widget buildButton({
  required String text,
    required int value,
})=>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
          onPressed: (){},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('$value',
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            const SizedBox(height: 2,),
            Text(text,style: const TextStyle(fontSize: 16),)
          ],
        ),
          );


}
