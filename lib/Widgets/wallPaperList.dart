import 'package:flutter/material.dart';
import 'package:flutterpackage/Models/wallPaper.dart';
import 'package:flutterpackage/Views/ImagesViews.dart';

Widget wallPaperList({required List<WallPaperModel> wallPapers,context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      children: wallPapers.map((wallpaper) {
        return GridTile(
              child: GestureDetector(
                onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageViews(imageURL: wallpaper.src!.portrait ?? '')));
          },
          child: Hero(
            tag: wallpaper.src!.portrait ?? '',
            child: 
              Container(
                child: ClipRRect(
                  borderRadius: 
                  BorderRadius.circular(16),
                  child: Image.network("${wallpaper.src!.portrait}" )
                  ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
