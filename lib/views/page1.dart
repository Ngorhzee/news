import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/models/data_model.dart';
import 'package:news/widget/page1Widget.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool loading = false;
  Map<String, dynamic> data;
  List<Article> articles = [];
  String errorMessage = "";
  String titleError = "";
  bool hasError = false;

  Future news() async {
    setState(() {
      loading = true;
      print('isLoading');
    });

    http.Response response;
    response = await http.get(
        "https://newsapi.org/v2/everything?q=tesla&from=2021-06-20&sortBy=publishedAt&apiKey=8dedd6595a514cae9bbcfba5940dccc4");
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);

        //print(data["articles"]);

        // articles= data["articles"].map((element){
        //   return Article.fromJson(element);
        // });

        data["articles"].forEach((element) {
          articles.add(Article.fromJson(element));
        });
      });
    }
    setState(() {
      loading = false;
      print('isLoading');
    });
  }
  // @override
  // void initState() {
  //   news();

  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ))
            : articles.length <= 0
                ? Center(
                    child: RaisedButton(
                      onPressed: () {
                        news();
                        print('news gotten');
                      },
                      child: Text(
                        hasError ? 'try again' : 'Get news',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        
                        color: Colors.blue,
                        height: 100,
                        width: double.infinity,
                        alignment: Alignment.bottomLeft,
                        child: Text("Today's News",
                            style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              Article datamodel = articles[index];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Page1_widget(
                                        article: datamodel,),
                                    //Page1_widget(picture: datamodel.image,title: datamodel.title,writter: datamodel.author,date: datamodel.date),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  )

        // body:
        // data==null?Container():Text(
        //   data['articles'].toString()
        // )

        );
  }
}
