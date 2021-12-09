import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterpackage/Data/data.dart';
import 'package:flutterpackage/Models/wallPaper.dart';
import 'package:flutterpackage/Widgets/wallPaperList.dart';
import 'package:flutterpackage/Widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;
  Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallPaperModel> wallPapers = [];
  TextEditingController searchController = TextEditingController();

  getSearchWallpapers(String query) async {
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
  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                            decoration: InputDecoration(hintText: 'search'),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            getSearchWallpapers(searchController.text);
                          },
                          child: Icon(Icons.search))
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  wallPaperList(wallPapers: wallPapers, context: context),
            ]
          ),
        ),
      ),
    );
  }
}