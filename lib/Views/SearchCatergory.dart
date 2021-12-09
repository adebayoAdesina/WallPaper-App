import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterpackage/Data/data.dart';
import 'package:flutterpackage/Models/wallPaper.dart';
import 'package:flutterpackage/Widgets/wallPaperList.dart';
import 'package:flutterpackage/Widgets/widgets.dart';
import 'package:http/http.dart' as http;

class SearchCatergory extends StatefulWidget {
  final String categoriesNames;
  SearchCatergory({required this.categoriesNames});

  @override
  _SearchCatergoryState createState() => _SearchCatergoryState();
}

class _SearchCatergoryState extends State<SearchCatergory> {
  List<WallPaperModel> wallPapers = [];
  @override

  getSearchCategoryWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=15&page=1'),
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
  void initState() {
    getSearchCategoryWallpapers(widget.categoriesNames);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
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
                  ),
                  SizedBox(height: 16,),
                  wallPaperList(wallPapers: wallPapers, context: context),
            ]
          ),
        ),)); }
}