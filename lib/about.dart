import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future <List> AboutSection() async{
  final response = await http.get(Uri.parse('https://abualhassan.pythonanywhere.com/api/about/retrive-about-section'), headers:{"accept":"application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

class about extends StatefulWidget {


  @override
  _aboutState createState() => _aboutState();

}


class _aboutState extends State<about>  {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "New Task",
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color.fromRGBO(255, 255, 255, 1.0),
          accentColor: const Color.fromRGBO(128, 0, 0, 1.0),
          fontFamily: 'Tajawal',
          primarySwatch: Colors.blue,

        ),
        home: Directionality( // add this
        textDirection: TextDirection.rtl, // set this property
        child: Scaffold(

          appBar: new AppBar(
            title: Center(
                child: Image.asset(
                  'assets/photo_2021-11-25_17-49-44.jpg',
                  height: 100.0,
                )),

          ),


          body:
          Container(

            color: const Color.fromRGBO(255, 255, 255, 1.0),
    child: ListView(
    children: <Widget>[


    new  Container(
      height: 250.0,
     child: FittedBox(
        child: Image.asset('assets/about.jpg',),
        fit: BoxFit.fill,
      ),

        ),
      Center(

        child:  Container(

          width: 330.0,
          padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),

          child:  Column(
            children: [
              Text('من نحن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(147, 0, 15, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold,),),
               Container(
                height: double.maxFinite,
                color: const Color.fromRGBO(255, 255, 255, 1.0),
//                 child: FutureBuilder(
//                   future: AboutSection(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           Map  post ;
//                           post= snapshot.data[index];
//                           print("hhhh ${post}");

//                           var description= post['description'];

// return      Container(
//   padding: EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 5),
//   child: Text( description,
//       style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),

// );

//                         },
//                       );
//                     }

//                     return Center(
//                       child: Container(
//                           height: 50,
//                           width: 50,
//                           child: CircularProgressIndicator()),
//                     );
//                   },
              
              
              
//                 ),

              ),


            ],
          ),
        ) ,
      )

              ]
    )

          ),

        )
        )
    );
  }

}
