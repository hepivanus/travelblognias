import 'package:flutter/material.dart';
import 'package:travel/widgets/most_populer.dart';
import 'package:travel/widgets/travel_blog.dart';
class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
    backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       actions: [
         Padding(
           padding: EdgeInsets.only(right: 10),
           child: Icon(Icons.menu, 
           color: Colors.black,),),     
       ],
     ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.only(left: 8),
           child: Text("Travel Blog Nias", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
         ),
         Expanded(
           flex: 2,
           child: TravelBlog()),
         Padding(
           padding: EdgeInsets.all(15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text("Most Popular",style: TextStyle(fontSize: 20),),
               Text("View Popular", style: TextStyle(fontSize: 15, color: Colors.deepOrange),),
             ],
           ),
         ),
         Expanded(
           flex: 1,
           child: MostPopuler()),
       ],
     ),
    );
  }
}