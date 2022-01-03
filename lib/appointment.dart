import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

postUser() async{
  var response = await http.post(
  Uri.parse("https://abualhassan.pythonanywhere.com/api/userForm/create-user-form"),
    body: {
    "categoryId": "1",
        "themeId":"20",
      "fullname": "test",
      "email":"test",
      "phone":"28767",

    });
  print('rrr${response.body}');
}

class appointment extends StatefulWidget {


  @override
  _appointmentState createState() => _appointmentState();

}


class _appointmentState extends State<appointment>  {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "New Task",
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color.fromRGBO(255, 255, 255, 1.0),
          accentColor: const Color.fromRGBO(128, 0, 0, 1.0),
          fontFamily: 'Cairo',
          primarySwatch: Colors.blue,

        ),
        home: Directionality( // add this
            textDirection: TextDirection.rtl, // set this property
            child:Scaffold(
              resizeToAvoidBottomInset:false,
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
                      height: 180.0,
                      child: FittedBox(
                        child: Image.asset('assets/contact_us_banner_long2.jpg',),
                        fit: BoxFit.fill,
                      ),

                    ),
                    Center(
                      child:  Container(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                        child:  Column(
                          children: [
                            Text('احجز موعدك' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(147, 0, 15, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ) ,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                        child:  Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 5),

                                child: Text('الاسم الكامل:', style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: new TextField(
                                  decoration: new InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),

                                    ),

                                  ),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      height: 0.1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                        child:  Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.only(left: 5, top: 0, right: 10, bottom: 0),

                                child: Text('البريد الالكتروني:', style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: new TextField(
                                  decoration: new InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),

                                    ),

                                  ),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      height: 0.1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                        child:  Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.only(left: 5, top: 0, right: 10, bottom: 0),

                                child: Text('رقم الهاتف:', style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: new TextField(
                                  decoration: new InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),

                                    ),

                                  ),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      height: 0.1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ],
                        )
                    ),

                    Container(
                        padding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                        child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 5, top: 0, right: 10, bottom: 0),

                           child: Text('العمر:', style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),
                          ),

                          new Flexible(
                            child:   Padding(
                              padding: EdgeInsets.all(15),
                              child: new TextField(
                                  decoration: new InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),

                                    ),

                                  ),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      height: 0.1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text('القسم:', style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),

                          new Flexible(
                            child:   Padding(
                              padding: EdgeInsets.all(15),
                              child: new TextField(
                                  decoration: new InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),

                                    ),

                                  ),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      height: 0.1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                      child: FlatButton(
                        child: Text('أرسال', style: TextStyle(fontSize: 16.0),),
                        color: Color.fromRGBO(147, 0, 15, 1.0),
                        textColor: Colors.white,
                        onPressed: () {
                          postUser();
                        },
                      ),
                    ),

                  ]
              )

          ),

        ) )
    );
  }

}
