import 'package:flutter/material.dart';
import 'dart:convert';


class category extends StatefulWidget {


  @override
  _categoryState createState() => _categoryState();

}


class _categoryState extends State<category>  {



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
            Container(
            child: Column(
              children: [
                Container(
                  width: 200.0,
                  // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
                  // height: double.infinity,
                  // width: double.infinity,
                  padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                  margin: EdgeInsets.only(left: 5, top: 15, right: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child:  Column(
                    children: [
                      Image.asset('assets/palette.png' ,width: 100.0,height: 100.0,),
                      Text('فن' , style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,),)
                    ],
                  ),
                ),
                Container(
                  width: 200.0,

                  // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
                  // height: double.infinity,
                  // width: double.infinity,
                  padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                  margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child:   Column(
                    children: [
                      Image.asset('assets/playtime.png' ,width: 100.0,height: 100.0,),
                      Text('اطفال' , style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,),)
                    ],
                  ),
                ),
                Container(
                    width: 200.0,

                    // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
                  // height: double.infinity,
                  // width: double.infinity,
                    padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                    margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child:  Column(
                      children: [
                        Image.asset('assets/psychiatry.png' ,width: 100.0,height: 100.0,),
                        Text('نفسي' , style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,),)
                      ],
                    )
                ),
              ],
            ),
            ),
            ]
          ),

        ),
    )));
  }

}
