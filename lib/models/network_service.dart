
import 'package:http/http.dart' as http;
import 'dart:convert';

const Map<String,dynamic> temp = {};
getData(String url,{Map<String,dynamic> params = temp,post = true}) async{
  final http.Response result;
  if(post) {
    result = await http.post(Uri.parse(url), body:params);
  } else {
    result = await http.get(Uri.parse(url));
  }
  //print(result.body);
  return jsonDecode(result.body);
}