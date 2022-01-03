import 'package:flutter/material.dart';
import 'dart:convert';


class postdetails extends StatefulWidget {
  String? title = '', description = '', image = '', date = ''  ;
  int? GatId;


  postdetails(
      {this.title,
        this.description,
        this.image,
        this.date,

      });

  @override
  _postdetailsState createState() => _postdetailsState();

}


class _postdetailsState extends State<postdetails>  {



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
                leading: GestureDetector(
                    onTap: () {
                      Navigator
                          .pop(context);},
                    child: Icon(Icons.arrow_back)),
              ),


              body:
              Container(

                  color: const Color.fromRGBO(255, 255, 255, 1.0),
                  child: ListView(
                      children: <Widget>[


                        Center(
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.3,
                            decoration: new BoxDecoration(
                              color: Colors.transparent,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.colorBurn),
                                  image: AssetImage('assets/logo.png')),
                            ),
                            child: Container(
                                height: double.maxFinite,
                                decoration: new BoxDecoration(
                                  color: Colors.transparent,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.2),
                                          BlendMode.colorBurn),
                                      image: new NetworkImage('http://46.101.55.159:8000${widget.image}')),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 270.0),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 254, 244, 1.0),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40)),
                                    ),
                                    height: 50.0,
                                  ),
                                )),
                          ),
                        ),
                        Center(
                          child:  Container(
                            // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
                            // height: double.infinity,
                            // width: double.infinity,
                            width: 330.0,
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                            //transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                            // decoration: BoxDecoration(
                            //   color: const Color.fromRGBO(255, 255, 255, 1.0),
                            //   borderRadius: BorderRadius.only(
                            //       topLeft: Radius.circular(10),
                            //       topRight: Radius.circular(10),
                            //       bottomLeft: Radius.circular(10),
                            //       bottomRight: Radius.circular(10)
                            //   ),
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: Colors.grey.withOpacity(0.3),
                            //       spreadRadius: 3,
                            //       blurRadius: 5,
                            //       offset: Offset(0, 1), // changes position of shadow
                            //     ),
                            //   ],
                            // ),
                            child:  Column(
                              children: [
                                Text(widget.title.toString() , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(147, 0, 15, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold,),),
                                Container(
                                  padding: EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 5),
                                  child: Text(widget.description.toString()
                                      ,
                                      style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),

                                )


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
