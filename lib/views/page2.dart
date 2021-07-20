import 'package:flutter/material.dart';

import 'package:news/models/data_model.dart';

class Page_2 extends StatelessWidget {
 
  final Article content;
  Page_2({this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(content.image??"no image to display"),
            ),
            SizedBox(height: 10),
            Row(children: [
              Text(
                  content.date.day.toString() +
                      "/" +
                      content.date.month.toString() +
                      "/" +
                      content.date.year.toString()??"null",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Spacer(),
              Text(content.author??"no name",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 16))
            ]),
            Text(content.title??"null",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            SizedBox(height: 10),
            Expanded(
                child: Text(content.content??"no content",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w100)))
          ],
        ),
      ),
    );
  }
}
