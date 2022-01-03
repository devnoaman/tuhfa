import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'postdetails.dart';
import 'package:cached_network_image/cached_network_image.dart';

Future <List> Posts() async{
  final response = await http.get(Uri.parse('https://abualhassan.pythonanywhere.com/api/posts/get_all_posts'), headers:{"accept":"application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}
class gallery extends StatefulWidget {


  @override
  _galleryState createState() => _galleryState();

}


class _galleryState extends State<gallery>  {



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
        home: Scaffold(

          appBar: new AppBar(
            title: Center(
                child: Image.asset(
                  'assets/photo_2021-11-25_17-49-44.jpg',
                  height: 100.0,
                )),

          ),


          body:
          Container(
          height: double.maxFinite,
            color: const Color.fromRGBO(255, 255, 255, 1.0),

            // child: FutureBuilder(
            //   future: Posts(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return GridView.builder(

            //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 3,
            //         ),
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount: snapshot.data!.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           Map  post ;
            //             post= snapshot.data[index];
            //           print("hhhh ${post}");
            //             var title =post['title'];
            //             var description= post['description'];
            //             var image =post['image'];
            //             var date = post['created_on'];
            //             date = date.replaceAll('T', ' | ');
            //             date =date.substring(0, 18);
            //             return gallerypost(title, description,image, date);
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

        )
    );
  }
Widget gallerypost(String title, String description, String image, String date){

  return GestureDetector(
      onTap: () {
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => postdetails(
              title: title,
              description:description,
              image:image,
              date: date,

          ),
        ));
  },


    child: Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // FadeInImage.memoryNetwork(
            //   placeholder: kTransparentImage,
            //   image: product.image,
            //   height: 200,
            // ),
            CachedNetworkImage(
              imageUrl: 'https://abualhassan.pythonanywhere.com$image',
              height: 90,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) {
                debugPrint('error: $error');
                return Icon(Icons.error);
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     title,
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),


          ],
        ),
      ),
    ),

  );
}
}
