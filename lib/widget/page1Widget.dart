import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news/models/data_model.dart';
import 'package:news/views/page2.dart';

class Page1_widget extends StatelessWidget {
final Article article;
  Page1_widget({this.article });

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.black26, 
      height: 250,
      width: double.infinity,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          //color: Colors.black26,
          height: 150,
          width: double.infinity,
          //decoration: BoxDecoration(),
          child: Image.network(article.image,fit: BoxFit.fitHeight,),
        ),
        
        SizedBox(height: 10),
        FlatButton(
              onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context){
                 return Page_2(content:article);
               }));
              },
                  child: Text(article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize:25)),
        ),
                SizedBox(height:10),
         Row(children: [
           Text(article.author??"No author",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                Spacer(),
                Text(article.date.day.toString()+"/"+article.date.month.toString()+"/"+article.date.year.toString(),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
         ],)       
      ]),
    );
  }
}
