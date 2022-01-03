import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:accordion/accordion.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tuhfa/providers/calender_provider.dart';
import 'package:tuhfa/widgets/calender_view.dart';

Future<List> Category() async {
  final response = await http.get(
      Uri.parse(
          'https://abualhassan.pythonanywhere.com/api/categories/get_all_categories'),
      headers: {"accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

Future<List> Calender() async {
  final response = await http.get(
      Uri.parse(
          'https://abualhassan.pythonanywhere.com/api/schedule/retrieve_all_schedules'),
      headers: {"accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: Scaffold(
          appBar: new AppBar(
            title: Center(
                child: Image.asset(
              'assets/photo_2021-11-25_17-49-44.jpg',
              height: 100.0,
            )),
          ),
          body: ListView(children: <Widget>[
            SizedBox(height: 7.0),
            new Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(height: 7.0),
            Center(
                child: Text(
              'الاقسام',
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Color.fromRGBO(147, 0, 15, 1.0),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 7.0),
            Container(
              height: 200.0,
              color: const Color.fromRGBO(255, 255, 255, 1.0),

              // child: FutureBuilder(
              //   future: Category(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return GridView.builder(

              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3,
              //           childAspectRatio: (100 / 140),
              //         ),
              //         physics: const NeverScrollableScrollPhysics(),
              //         itemCount: 3,

              //         itemBuilder: (BuildContext context, int index) {
              //           Map  post ;
              //           post= snapshot.data[index];
              //           print("hhhh ${post}");
              //           var title =post['name'];
              //           var description= post['description'];
              //           var image =post['image'];
              //           return Cat(title, description,image);
              //         },
              //       );
              //     }

              //     return Center(
              //       child: Container(
              //           height: 50,
              //           width: 50,
              //           child: CircularProgressIndicator()),
              //     );
              //   },
              // ),
            ),

            SizedBox(height: 7.0),
            Center(
                child: Text(
              'الجدول الاسبوع',
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Color.fromRGBO(1, 85, 81, 1.0),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 7.0),

            CalenderView(),

            // Container(
            //   height: double.maxFinite,
            //   color: const Color.fromRGBO(255, 255, 255, 1.0),
            //
            //   child: FutureBuilder(
            //     future: Calender(),
            //     // take me to this
            //
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //
            //
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemCount: snapshot.data.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             Map  post ;
            //             post= snapshot.data[index];
            //
            //             var day =post['day'];
            //             var category= post['category']['name'];
            //             var date =post['created'];
            //             return calender(day, category,date);
            //           },
            //         );
            //       }
            //
            //       return Center(
            //         child: Container(
            //             height: 50,
            //             width: 50,
            //             child: CircularProgressIndicator()),
            //       );
            //     },
            //   ),
            //
            // ),
            // Container(

            //   child: Consumer<ClanderProvider>(

            //     builder: (context, day,_) {
            //       day.getDays();
            //       return Accordion(
            //         headerBackgroundColor: Color.fromRGBO(
            //             238, 237, 237, 0.4549019607843137),
            //         maxOpenSections: 50,
            //           disableScrolling:true,
            //        // header: Text('Introduction', style: _headerStyle),
            //         leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
            //         rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
            //         children: [
            //           // AccordionSection(
            //           //   isOpen: true,
            //           //   leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
            //           //   header:  Text('السبت 28/11/2021' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),),
            //           //   content: Wrap(
            //           //     children: [
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       ),
            //           //       const Divider(
            //           //         height: 10,
            //           //         thickness: 1,
            //           //         indent: 20,
            //           //         endIndent: 20,
            //           //         color: Color.fromRGBO(212, 213, 213, 1.0),
            //           //       ),
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       ),
            //           //       const Divider(
            //           //         height: 10,
            //           //         thickness: 1,
            //           //         indent: 20,
            //           //         endIndent: 20,
            //           //         color: Color.fromRGBO(212, 213, 213, 1.0),
            //           //       ),
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       )
            //           //     ],
            //           //   ),
            //           // ),
            //           // AccordionSection(
            //           //   isOpen: false,
            //           //   leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
            //           //   header:  Text('الاحد 28/11/2021' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),),
            //           //   content: Wrap(
            //           //     children: [
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       ),
            //           //       const Divider(
            //           //         height: 10,
            //           //         thickness: 1,
            //           //         indent: 20,
            //           //         endIndent: 20,
            //           //         color: Color.fromRGBO(212, 213, 213, 1.0),
            //           //       ),
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       ),
            //           //       const Divider(
            //           //         height: 10,
            //           //         thickness: 1,
            //           //         indent: 20,
            //           //         endIndent: 20,
            //           //         color: Color.fromRGBO(212, 213, 213, 1.0),
            //           //       ),
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       )
            //           //     ],
            //           //   ),
            //           // ),
            //           //  AccordionSection(
            //           //   isOpen: false,
            //           //   leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
            //           //   header:  Text('الاثنين 28/11/2021' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),),
            //           //   content: Wrap(
            //           //     children: [
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       ),
            //           //       const Divider(
            //           //         height: 10,
            //           //         thickness: 1,
            //           //         indent: 20,
            //           //         endIndent: 20,
            //           //         color: Color.fromRGBO(212, 213, 213, 1.0),
            //           //       ),
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       ),
            //           //       const Divider(
            //           //         height: 10,
            //           //         thickness: 1,
            //           //         indent: 20,
            //           //         endIndent: 20,
            //           //         color: Color.fromRGBO(212, 213, 213, 1.0),
            //           //       ),
            //           //       Row(
            //           //         children: [
            //           //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
            //           //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
            //           //           Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),
            //           //           Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
            //           //           Expanded(
            //           //             child: Container(),
            //           //           ),

            //           //         ],
            //           //       )
            //           //     ],
            //           //   ),
            //           // ),

            //         ],
            //       );
            //     }
            //   ),
            // ),
            /*   Container(
                child: Column(
                  children: [
                    Container(
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
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child:  Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),),
                              Icon(Icons.calendar_today_outlined, color: Colors.black,),
                              Text('السبت 28/11/2021' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),)
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                              color: Color.fromRGBO(212, 213, 213, 1.0),
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color.fromRGBO(212, 213, 213, 1.0),
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          )
                         ],
                      ),
                    ),
                    Container(
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
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child:  Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),),
                              Icon(Icons.calendar_today_outlined, color: Colors.black,),
                              Text('الاحد 28/11/2021' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),)
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color.fromRGBO(212, 213, 213, 1.0),
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color.fromRGBO(212, 213, 213, 1.0),
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
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
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child:  Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),),
                              Icon(Icons.calendar_today_outlined, color: Colors.black,),
                              Text('الاثنين 28/11/2021' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),)
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color.fromRGBO(212, 213, 213, 1.0),
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color.fromRGBO(212, 213, 213, 1.0),
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                              Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                              Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),
                              Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                              Expanded(
                                child: Container(),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),*/
          ]),
        ),
      ),
    );
  }

  Widget Cat(String title, String description, String image) {
    return IntrinsicHeight(
        child: Row(
      children: [
        Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
          margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://abualhassan.pythonanywhere.com$image',
                height: 100,
                width: 100,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) {
                  debugPrint('error: $error');
                  return Icon(Icons.error);
                },
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: Color.fromRGBO(147, 0, 15, 1.0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        // Container(
        //   padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        //   margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         topRight: Radius.circular(10),
        //         bottomLeft: Radius.circular(10),
        //         bottomRight: Radius.circular(10)
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.3),
        //         spreadRadius: 3,
        //         blurRadius: 5,
        //         offset: Offset(0, 1), // changes position of shadow
        //       ),
        //     ],
        //   ),
        //   child:  Column(
        //     children: [
        //       Image.asset('assets/canvas.png' ,width: 100.0,height: 100.0,),
        //       Text('فن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(147, 0, 15, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold,),)
        //     ],
        //   ),
        // ),
        // Container(
        //   // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
        //   // height: double.infinity,
        //   // width: double.infinity,
        //   padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        //   margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         topRight: Radius.circular(10),
        //         bottomLeft: Radius.circular(10),
        //         bottomRight: Radius.circular(10)
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.3),
        //         spreadRadius: 3,
        //         blurRadius: 5,
        //         offset: Offset(0, 1),
        //       ),
        //     ],
        //   ),
        //   child:   Column(
        //     children: [
        //       Image.asset('assets/maternity.png' ,width: 100.0,height: 100.0,),
        //       Text('اطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(147, 0, 15, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold,),)
        //     ],
        //   ),
        // ),
        // Container(
        //   // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
        //   // height: double.infinity,
        //   // width: double.infinity,
        //     padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        //     margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(10),
        //           topRight: Radius.circular(10),
        //           bottomLeft: Radius.circular(10),
        //           bottomRight: Radius.circular(10)
        //       ),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey.withOpacity(0.3),
        //           spreadRadius: 3,
        //           blurRadius: 5,
        //           offset: Offset(0, 1),
        //         ),
        //       ],
        //     ),
        //     child:  Column(
        //       children: [
        //         Image.asset('assets/mental-health.png' ,width: 100.0,height: 100.0,),
        //         Text('نفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(147, 0, 15, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold,),)
        //       ],
        //     )
        // ),
      ],
    ));
  }

  Widget calender(String day, String category, String date) {
    return Container(
      child: Accordion(
        headerBackgroundColor:
            Color.fromRGBO(238, 237, 237, 0.4549019607843137),
        maxOpenSections: 50,
        // header: Text('Introduction', style: _headerStyle),
        leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
        rightIcon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        children: [
          AccordionSection(
            // isOpen: true,
            leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
            header: Text(
              '${date} ${day} ',
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Color.fromRGBO(1, 85, 81, 1.0),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Wrap(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5, top: 5, right: 20, bottom: 5),
                    ),
                    Icon(
                      Icons.watch_later_outlined,
                      color: Color.fromRGBO(120, 125, 125, 1.0),
                      size: 20.0,
                    ),
                    Text(
                      '6:00 - 8:00pm',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(120, 125, 125, 1.0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'قسم الفن',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(120, 125, 125, 1.0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 213, 213, 1.0),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5, top: 5, right: 20, bottom: 5),
                    ),
                    Icon(
                      Icons.watch_later_outlined,
                      color: Color.fromRGBO(120, 125, 125, 1.0),
                      size: 20.0,
                    ),
                    Text(
                      '6:00 - 8:00pm',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(120, 125, 125, 1.0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'قسم النفسي',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(120, 125, 125, 1.0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(212, 213, 213, 1.0),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5, top: 5, right: 20, bottom: 5),
                    ),
                    Icon(
                      Icons.watch_later_outlined,
                      color: Color.fromRGBO(120, 125, 125, 1.0),
                      size: 20.0,
                    ),
                    Text(
                      '10:00 - 12:00pm',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(120, 125, 125, 1.0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'قسم الاطفال',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(120, 125, 125, 1.0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
