import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuhfa/enums.dart';
import 'package:tuhfa/providers/calender_provider.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {


      await Provider.of<ClanderProvider>(context,listen: false).getDays();

     });
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.red,
          
                        child: Consumer<ClanderProvider>(
                         
                          builder: (context, day,_) {
                            day.getDays();
          
          
                            if(day.state==ScreenState.busy){
                              return SizedBox();
                            }
return ListView.builder(
  
  shrinkWrap: true,
  
  
  itemBuilder: (context,index){

  return Container( 



    width: 12,height: 24,color: Colors.red,
  );

});



                //             return Accordion(
                //               headerBackgroundColor: Color.fromRGBO(
                //                   238, 237, 237, 0.4549019607843137),
                //               maxOpenSections: 50,
                //                 disableScrolling:true,
                             
                //               leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
                //               rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                //               children: (day.state ==ScreenState.idle)?
                              
                //               day.model.map((e){
                //                 return AccordionSection(
                //  // isOpen: true,
                //   leftIcon: Icon(Icons.calendar_today_outlined, color: Colors.black),
                //   header:  Text( e.day.toString(), style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(1, 85, 81, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold,),),
                //   content: Wrap(
                //     children: [
                //       Row(
                //         children: [
                //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                //           Expanded(
                //             child: Container(),
                //           ),
                //           Text('قسم الفن' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                //           Expanded(
                //             child: Container(),
                //           ),
          
                //         ],
                //       ),
                //       const Divider(
                //         height: 10,
                //         thickness: 1,
                //         indent: 20,
                //         endIndent: 20,
                //         color: Color.fromRGBO(212, 213, 213, 1.0),
                //       ),
                //       Row(
                //         children: [
                //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                //           Text('6:00 - 8:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                //           Expanded(
                //             child: Container(),
                //           ),
                //           Text('قسم النفسي' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                //           Expanded(
                //             child: Container(),
                //           ),
          
                //         ],
                //       ),
                //       const Divider(
                //         height: 10,
                //         thickness: 1,
                //         indent: 20,
                //         endIndent: 20,
                //         color: Color.fromRGBO(212, 213, 213, 1.0),
                //       ),
                //       Row(
                //         children: [
                //           Padding(padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 5),),
                //           Icon(Icons.watch_later_outlined, color: Color.fromRGBO(120, 125, 125, 1.0), size: 20.0,),
                //           Text('10:00 - 12:00pm' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                //           Expanded(
                //             child: Container(),
                //           ),
                //           Text('قسم الاطفال' , style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(120, 125, 125, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold,),),
                //           Expanded(
                //             child: Container(),
                //           ),
          
                //         ],
                //       )
                //     ],
                //   ),
                // );
                //               }).toList()
                              
                              
                              
                //               :[],
                //             );
                         
                         
                         
                          }
                        ),
                      ),
      ),
    );
  }
}