import 'package:flutter/material.dart';
import 'package:tuhfa/widgets/calender_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CalenderView(),
    );
  }
}
