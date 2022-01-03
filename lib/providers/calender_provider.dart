import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuhfa/enums.dart';
import 'dart:convert';

import 'package:tuhfa/models/calender_model.dart';

class ClanderProvider extends ChangeNotifier{
  ScreenState state = ScreenState.idle;
  List<dynamic> currentResponse =[];
  List<CalenderModel> model=[];


void addToList(CalenderModel item){
  if(!model.contains(item)){
    model.add(item);
    notifyListeners();
  }
}


  

getDays() async{
ScreenState state = ScreenState.idle;
try{
final response = await http.get(Uri.parse('https://abualhassan.pythonanywhere.com/api/schedule/retrieve_all_schedules'), headers:{"accept":"application/json"});
    currentResponse = jsonDecode(response.body);

  await
   currentResponse.map((e) => addToList(CalenderModel.fromJson(e))
  ).toList();
  state=ScreenState.idle;

 print (model[0].created);

} catch (e){
  state=ScreenState.idle;
  notifyListeners();


  print(e);
}
    
  }
}