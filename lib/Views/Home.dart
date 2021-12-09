import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterpackage/Data/data.dart';

import 'package:flutterpackage/Models/categoriesModel.dart';
import 'package:flutterpackage/Models/wallPaper.dart';
import 'package:flutterpackage/Views/Search.dart';
import 'package:flutterpackage/Widgets/Catergory.dart';
import 'package:flutterpackage/Widgets/wallPaperList.dart';
import 'package:flutterpackage/Widgets/widgets.dart';

import 'package:http/http.dart' as http;
import 'dart:core';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallPaperModel> wallPapers = [];
  TextEditingController searchController = TextEditingController();

  getTreding() async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=15&page=1'),
        headers: {
          'Authorization': apiKey,
        });
        //  print(response);

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((images) {
      WallPaperModel wallPaperModel = WallPaperModel();
      wallPaperModel = WallPaperModel.fromMap(images);
      wallPapers.add(wallPaperModel);
     
      
      
    });
    setState(() {});
  }

  @override
  void initState() {
    getTreding();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: brandName(),
          // elevation: 0.0,  // for removing the shadow of the navbar
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 34),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      color: Color(0xff5f8fd),
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(hintText: "search"),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Search(searchQuery: searchController.text)));},
                        child: Icon(Icons.search))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Category(
                            title: categories[index].categoriesName,
                            imageURL: categories[index].imageURL);
                      }),
                ),
                SizedBox(height: 16,),
                wallPaperList(wallPapers: wallPapers, context: context),
              ],
            ),
          ),
        ));
  }
}
