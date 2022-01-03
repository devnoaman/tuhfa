import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:tuhfa/pages/home_page.dart';
import 'package:tuhfa/providers/calender_provider.dart';
import 'category.dart';
import 'main_page.dart';
import 'gallery.dart';
import 'about.dart';
import 'appointment.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ClanderProvider(),)
  ],child: StartPage()));
}
@override

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: "New Task",
      debugShowCheckedModeBanner: false,


     // home: HomePage(),
     home: MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(13, 23, 34, 1.0),
        accentColor: const Color.fromRGBO(128, 0, 0, 1.0),
        fontFamily: 'Cairo',


      ),

    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>

    with SingleTickerProviderStateMixin {

// to navigate from one page to another


  @override


  int selectedPage = 0;
  final _pageOptions = [MainPage(), category(), gallery()  ,appointment(), about()];



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color.fromRGBO(13, 23, 34, 1.0),
            accentColor: const Color.fromRGBO(128, 0, 0, 1.0),
            fontFamily: 'Cairo'
        ),
        home: Directionality( // add this
          textDirection: TextDirection.rtl, // set this property
          child: new Scaffold(


              body:
              _pageOptions[selectedPage],
              bottomNavigationBar: ConvexAppBar(
                backgroundColor: const Color.fromRGBO(13, 23, 34, 1.0),
                height: 58.0,

                items: [
                  TabItem(icon: Icons.home, title: 'الرئيسية' ),
                  TabItem(icon: Icons.category_outlined, title: 'ألاقسام'),
                  TabItem(icon: Icons.image_outlined, title: 'المعرض'),
                  TabItem(icon: Icons.send_outlined, title: 'حجز'),
                  TabItem(icon: Icons.info_outline_rounded, title: 'من نحن'),
                ],
                initialActiveIndex: selectedPage,//optional, default as 0
                onTap: (int index ){
                  setState(() {
                    selectedPage = index;
                  });
                },
              )
          ),
        ),
         );
  }

}
